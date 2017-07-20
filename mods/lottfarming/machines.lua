-- TODO: Abstract some of this since a lot of code is shared.

farming.threshing_floor_formspec =
"size[8,10]"..
"label[3,0;Threshing Floor]"..
"label[1,1;Punch with wheat or barley to obtain straw and seeds]"..
"label[2,2;Straw]"..
"label[4.5,2;Wheat Seeds]"..
"list[context;straw;1.5,3;2,2]"..
"list[context;seeds;4.5,3;2,2]"..
"list[current_player;main;0,6;8,4]"..
"listring[context;straw]"..
"listring[current_player;main]"..
"listring[context;seeds]"..
"listring[current_player;main]"..
"background[-0.5,-0.5;9,11;gui_chestbg.png]"

farming.mill_formspec = 
"size[8,10]"..
"label[3.5,0;Mill]"..
"label[1,1;Punch to turn corn, barley or wheat seeds into flour]"..
"label[2,2;Seeds]"..
"label[5,2;Flour]"..
"list[context;seeds;1.5,3;2,2]"..
"list[context;flour;4.5,3;2,2]"..
"list[current_player;main;0,6;8,4]"..
"listring[context;seeds]"..
"listring[current_player;main]"..
"listring[context;seeds]"..
"listring[context;flour]"..
"listring[current_player;main]"..
"background[-0.5,-0.5;9,11;gui_chestbg.png]"

farming.spinning_wheel_formspec = 
"size[8,10]"..
"label[3,0;Spinning Wheel]"..
"label[2.2,1;Punch to spin cotton into yarn]"..
"label[2,2;Cotton]"..
"label[5,2;Yarn]"..
"list[context;cotton;1.5,3;2,2]"..
"list[context;yarn;4.5,3;2,2]"..
"list[current_player;main;0,6;8,4]"..
"listring[context;cotton]"..
"listring[current_player;main]"..
"listring[context;cotton]"..
"listring[context;yarn]"..
"listring[current_player;main]"..
"background[-0.5,-0.5;9,11;gui_chestbg.png]"

farming.loom_formspec = 
"size[8,10]"..
"label[3.5,0;Loom]"..
"label[2,1;Punch to weave yarn into fabric]"..
"label[2,2;Yarn]"..
"label[5,2;Fabric]"..
"list[context;yarn;1.5,3;2,2]"..
"list[context;fabric;4.5,3;2,2]"..
"list[current_player;main;0,6;8,4]"..
"listring[context;yarn]"..
"listring[current_player;main]"..
"listring[context;yarn]"..
"listring[context;fabric]"..
"listring[current_player;main]"..
"background[-0.5,-0.5;9,11;gui_chestbg.png]"

-- TODO: add different types of flour
minetest.register_node("lottfarming:mill", {
	description = "Flour Mill",
	tiles = {"default_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2},
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		meta:set_string("infotext", "Flour Mill")
		inv:set_size("seeds", 4)
		inv:set_size("flour", 4)
		meta:set_string("formspec", farming.mill_formspec)
	end,
	on_punch = function(pos, node, puncher, pointed_thing)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local src_stack = nil
		local result_stack = nil
		-- If multiple grain types are in the seeds list, they are always
		-- removed in the order wheat -> corn -> barley
		if inv:contains_item("seeds", ItemStack("farming:seed_wheat 4")) then
			src_stack = ItemStack("farming:seed_wheat 4")
			result_stack = ItemStack("farming:flour")
		elseif inv:contains_item("seeds", ItemStack("lottfarming:corn 4")) then
			src_stack = ItemStack("lottfarming:corn 4")
			result_stack = ItemStack("farming:flour")
		elseif inv:contains_item("seeds", ItemStack("lottfarming:barley_seed 4")) then
			src_stack = ItemStack("lottfarming:barley_seed 4")
			result_stack = ItemStack("farming:flour")
		else
			minetest.chat_send_player(puncher:get_player_name(), "At least four seeds are needed to make flour.")
		end
		if inv:room_for_item("flour", result_stack) then
			inv:add_item("flour", result_stack)
			inv:remove_item("seeds", src_stack)
		end
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if listname == "seeds" and (
			stack:get_name() == "farming:seed_wheat" or
			stack:get_name() == "lottfarming:corn" or
			stack:get_name() == "lottfarming:barley_seed") then
			return stack:get_count()
		end
		return 0
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if not inv:is_empty("seeds") or not inv:is_empty("flour") then
			return false
		end
		return true
	end,
})

minetest.register_node("lottfarming:threshing_floor", {
	description = "Threshing Floor",
	tiles = {"default_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2},
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		meta:set_string("infotext", "Threshing Floor")
		inv:set_size("straw", 4)
		inv:set_size("seeds", 4)
		meta:set_string("formspec", farming.threshing_floor_formspec)
	end,
	on_punch = function(pos, node, puncher, pointed_thing)
		local wielded = puncher:get_wielded_item()
		if not wielded then return end
		local seed_stack = nil
		if wielded:get_name() == "farming:wheat" then
			seed_stack = ItemStack("farming:seed_wheat")
		elseif wielded:get_name() == "lottfarming:barley" then
			seed_stack = ItemStack("lottfarming:barley_seed")
		else
			return
		end
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local straw_stack = ItemStack("farming:straw")
		if inv:room_for_item("straw", straw_stack) and inv:room_for_item("seeds", seed_stack) then
			inv:add_item("straw", straw_stack)
			inv:add_item("seeds", seed_stack)
			wielded:take_item()
			puncher:set_wielded_item(wielded)
		else
			minetest.chat_send_player(puncher:get_player_name(), "Threshing floor is full.")
		end
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		return 0
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if not inv:is_empty("straw") or not inv:is_empty("seeds") then
			return false
		end
		return true
	end,
})

minetest.register_node("lottfarming:spinning_wheel", {
        description = "Spinning Wheel",
        tiles = {"default_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2},
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		meta:set_string("infotext", "Spinning Wheel")
		inv:set_size("cotton", 4)
		inv:set_size("yarn", 4)
		meta:set_string("formspec", farming.spinning_wheel_formspec)
	end,
	on_punch = function(pos, node, puncher, pointed_thing)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local src_stack = ItemStack("farming:cotton 4");
		if not inv:contains_item("cotton", src_stack) then
			minetest.chat_send_player(puncher:get_player_name(), "At least four units of cotton are needed to make yarn.")
			return
		end
		local result_stack = ItemStack("farming:yarn")
		if inv:room_for_item("yarn", result_stack) then
			inv:add_item("yarn", result_stack)
			inv:remove_item("cotton", src_stack)
		end
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if listname == "cotton" and stack:get_name() == "farming:cotton" then
			return stack:get_count()
		end
		return 0
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if not inv:is_empty("cotton") or not inv:is_empty("yarn") then
			return false
		end
		return true
	end,
})

minetest.register_node("lottfarming:loom", {
        description = "Loom",
        tiles = {"default_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2},
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		meta:set_string("infotext", "Loom")
		inv:set_size("yarn", 4)
		inv:set_size("fabric", 4)
		meta:set_string("formspec", farming.loom_formspec)
	end,
	on_punch = function(pos, node, puncher, pointed_thing)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local src_stack = ItemStack("farming:yarn 4");
		if not inv:contains_item("yarn", src_stack) then
			minetest.chat_send_player(puncher:get_player_name(), "At least four balls of yarn are needed to weave fabric.")
			return
		end
		local result_stack = ItemStack("wool:white")
		if inv:room_for_item("fabric", result_stack) then
			inv:add_item("fabric", result_stack)
			inv:remove_item("yarn", src_stack)
		end
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if listname == "yarn" and stack:get_name() == "farming:yarn" then
			return stack:get_count()
		end
		return 0
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if not inv:is_empty("yarn") or not inv:is_empty("fabric") then
			return false
		end
		return true
	end,
})
