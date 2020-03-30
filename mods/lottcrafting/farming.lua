-- TODO: add different types of flour

local register_machine = function(itemstring, name, instructions, x1, x2, x3, x4, src, dst, def)
	def.description = name
	def.tiles = {"default_wood.png"}
	def.groups = {cracky=2}
	def.is_ground_content = false
	def.on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		meta:set_string("infotext", name)
		inv:set_size("src", 4)
		inv:set_size("dst", 4)
		meta:set_string("formspec", "size[8,10]"..
			"label["..x1..",0;"..name.."]"..
			"label["..x2..",1;"..instructions.."]"..
			"label["..x3..",2;"..src.."]"..
			"label["..x4..",2;"..dst.."]"..
			"list[context;src;1.5,3;2,2]"..
			"list[context;dst;4.5,3;2,2]"..
			"list[current_player;main;0,6;8,4]"..
			"listring[context;src]"..
			"listring[current_player;main]"..
			"listring[context;src]"..
			"listring[context;dst]"..
			"listring[current_player;main]"..
			"background[-0.5,-0.5;9,11;gui_chestbg.png]"
		)
	end
	def.on_punch = function(pos, node, puncher, pointed_thing)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local def = lottcrafting.get_craft_result(itemstring, 2, inv:get_list("src"), "shapeless")
		if def and def.outputs then
			lottcrafting.handle_craft(def, inv, "src", "dst", puncher)
		else
			minetest.chat_send_player(puncher:get_player_name(), "No craft could be found for your input item(s)!")
		end
	end
	def.allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if listname == "src" then return stack:get_count() end
		return 0
	end
	def.can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if not inv:is_empty("src") or not inv:is_empty("dst") then
			return false
		end
		return true
	end
	minetest.register_node("lottcrafting:"..itemstring, def)
end

register_machine("mill", "Hand Mill", "Punch to grind items into flour.", 3.5, 2.2, 2, 5, "Source", "Flour", {})
register_machine("spinning_wheel", "Spinning Wheel", "Punch to spin cotton into yarn.", 3, 2.2, 2, 5, "Cotton", "Yarn",
	{drawtype = "mesh", mesh = "lottcrafting_spinning_wheel.obj",
	selection_box = {type = "fixed", fixed = {-.2, -.5, -.5, .2, .5, .5}},
	collision_box = {type = "fixed", fixed = {-.2, -.5, -.5, .2, .5, .5}},
	paramtype2 = "facedir"})
register_machine("loom", "Loom", "Punch to weave yarn into fabric.", 3.5, 2, 2, 5, "Yarn", "Fabric", {})

lottcrafting.threshing_floor_formspec =
"size[8,10]"..
"label[3,0;Threshing Floor]"..
"label[1,1;Punch with wheat or barley to obtain straw and seeds]"..
"label[3.5,2;Output]"..
"list[context;dst;2,3;4,2]"..
"list[current_player;main;0,6;8,4]"..
"listring[context;dst]"..
"listring[current_player;main]"..
"background[-0.5,-0.5;9,11;gui_chestbg.png]"

minetest.register_node("lottcrafting:threshing_floor", {
	description = "Threshing Floor",
	tiles = {"default_wood.png"},
	groups = {cracky=2},
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		meta:set_string("infotext", "Threshing Floor")
		inv:set_size("dst", 8)
		meta:set_string("formspec", lottcrafting.threshing_floor_formspec)
	end,
	on_punch = function(pos, node, puncher, pointed_thing)
		local wielded = puncher:get_wielded_item()
		if not wielded then return end
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local def = lottcrafting.get_craft_result_namelist("threshing_floor", {{wielded:get_name()}}, "shapeless")
		if not def or not def.outputs then return end
		local can_add = true
		for _, item in ipairs(def.outputs) do
			if not inv:room_for_item("dst", ItemStack(item)) then
				can_add = false
				minetest.chat_send_player(puncher:get_player_name(), "Threshing floor is full.")
				break
			end
		end
		if can_add then
			for _, item in ipairs(def.outputs) do
				inv:add_item("dst", ItemStack(item))
			end
			wielded:take_item()
			puncher:set_wielded_item(wielded)
		end
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		return 0
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if not inv:is_empty("dst") then
			return false
		end
		return true
	end,
})
