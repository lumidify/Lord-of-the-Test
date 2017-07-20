lottcrafting.dwarf_formspec =
"size[8,10]"..
"label[2.5,0;Dwarven Crafting Table]"..
"label[1,1;Inputs]"..
"label[6,1;Outputs]"..
"list[context;src;0,2;3,3]"..
"button[3,3;2,1;craft_button;Craft]"..
"list[context;dst;5,2;3,3]"..
"list[current_player;main;0,6;8,4]"..
"listring[context;dst]"..
"listring[current_player;main]"..
"listring[context;src]"..
"listring[current_player;main]"..
"background[-0.5,-0.5;9,11;gui_dwarfbg.png]"

minetest.register_node("lottcrafting:dwarf_table", {
	description = "Dwarven Crafting Table",
	tiles = {"default_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2},
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		meta:set_string("infotext", "Dwarven Crafting Table")
		inv:set_size("src", 9)
		inv:set_width("src", 3)
		inv:set_size("dst", 9)
		meta:set_string("formspec", lottcrafting.dwarf_formspec)
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		if fields.craft_button and fields.craft_button ~= "" then
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			if inv:is_empty("src") then return end
			local src_list = inv:get_list("src")
			local def = lottcrafting.get_craft_result("dwarf", inv:get_width("src"), src_list)
			if def then
				local can_add = true
				for _, item in ipairs(def.outputs) do
					if not inv:room_for_item("dst", ItemStack(item)) then
						can_add = false
						break
					end
				end
				if can_add then
					for _, item in ipairs(def.outputs) do
						inv:add_item("dst", ItemStack(item))
					end
					for k, v in ipairs(def.inputs) do
						for _, item in ipairs(v) do
							inv:remove_item("src", ItemStack(item))
						end
					end
				end
			end
		end
	end
	-- TODO: add can_dig
})
