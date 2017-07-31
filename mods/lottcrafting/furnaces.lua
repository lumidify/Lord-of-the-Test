-- Adapted from default furnace
-- TODO: Different textures

local function swap_node(pos,name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos,node)
end

function lottcrafting.get_furnace_active_formspec(pos, percent, item_percent)
	local formspec =
		"size[8,9]"..
		"image[1.5,1.5;1,1;default_furnace_fire_bg.png^[lowpart:"..
		(100-percent)..":default_furnace_fire_fg.png]"..
		"image[3,1.5;1,1;gui_furnace_arrow_bg.png^[lowpart:"..
		(item_percent)..":gui_furnace_arrow_fg.png^[transformR270]"..
		"list[current_name;fuel;1.5,2.5;1,1;]"..
		"list[current_name;src;1.5,0.5;1,1;]"..
		"list[current_name;dst;4.5,1;2,2;]"..
		"list[current_player;main;0,5;8,4;]"..
		"background[-0.5,-0.65;9,10.35;gui_furnacebg.png]"..
		"listcolors[#606060AA;#888;#141318;#30434C;#FFF]" ..
		"listring[current_name;src]"..
		"listring[current_player;main]"..
		"listring[current_name;src]"..
		"listring[current_name;fuel]"..
		"listring[current_player;main]"..
		"listring[current_name;dst]"..
		"listring[current_player;main]"
	return formspec
end

lottcrafting.furnace_inactive_formspec =
	"size[8,9]"..
	"image[1.5,1.5;1,1;default_furnace_fire_bg.png]"..
	"image[3,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
	"list[current_name;fuel;1.5,2.5;1,1;]"..
	"list[current_name;src;1.5,0.5;1,1;]"..
	"list[current_name;dst;4.5,1;2,2;]"..
	"list[current_player;main;0,5;8,4;]"..
  	"background[-0.5,-0.65;9,10.35;gui_furnacebg.png]"..
	"listcolors[#606060AA;#888;#141318;#30434C;#FFF]" ..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_name;fuel]"..
	"listring[current_player;main]"..
	"listring[current_name;dst]"..
	"listring[current_player;main]"

local register_furnace = function(itemstring, name, craft_type)
	minetest.register_node("lottcrafting:"..itemstring, {
		description = name,
		tiles = {"default_furnace_top.png", "default_furnace_bottom.png", "default_furnace_side.png",
			"default_furnace_side.png", "default_furnace_side.png", "default_furnace_front.png"},
		paramtype2 = "facedir",
		groups = {cracky=2},
		legacy_facedir_simple = true,
		is_ground_content = false,
		sounds = default.node_sound_stone_defaults(),
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", default.furnace_inactive_formspec)
			meta:set_string("infotext", name)
			local inv = meta:get_inventory()
			inv:set_size("fuel", 1)
			inv:set_size("src", 1)
			inv:set_size("dst", 4)
		end,
		can_dig = function(pos,player)
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			if not inv:is_empty("fuel") then
				return false
			elseif not inv:is_empty("dst") then
				return false
			elseif not inv:is_empty("src") then
				return false
			end
			return true
		end,
		-- TODO: abstract the following two functions because they are very similar
		allow_metadata_inventory_put = function(pos, listname, index, stack, player)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			if listname == "fuel" then
				if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
					if inv:is_empty("src") then
						meta:set_string("infotext", name.." is empty")
					end
					return stack:get_count()
				else
					return 0
				end
			elseif listname == "src" then
				return stack:get_count()
			elseif listname == "dst" then
				return 0
			end
		end,
		allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			local stack = inv:get_stack(from_list, from_index)
			if to_list == "fuel" then
				if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
					if inv:is_empty("src") then
						meta:set_string("infotext", name.." is empty")
					end
					return count
				else
					return 0
				end
			elseif to_list == "src" then
				return count
			elseif to_list == "dst" then
				return 0
			end
		end,

		--backwards compatibility: punch to set formspec
		on_punch = function(pos,player)
		    local meta = minetest.get_meta(pos)
		meta:set_string("infotext", name)
		meta:set_string("formspec",default.furnace_inactive_formspec)
	    end
	})

	minetest.register_node("lottcrafting:"..itemstring.."_active", {
		description = name,
		tiles = {"default_furnace_top.png", "default_furnace_bottom.png", "default_furnace_side.png",
			"default_furnace_side.png", "default_furnace_side.png", "default_furnace_front_active.png"},
		paramtype2 = "facedir",
		light_source = 8,
		drop = "lottcrafting:"..itemstring,
		groups = {cracky=2, not_in_creative_inventory=1,hot=1},
		legacy_facedir_simple = true,
		is_ground_content = false,
		sounds = default.node_sound_stone_defaults(),
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", default.furnace_inactive_formspec)
			meta:set_string("infotext", name);
			local inv = meta:get_inventory()
			inv:set_size("fuel", 1)
			inv:set_size("src", 1)
			inv:set_size("dst", 4)
		end,
		can_dig = function(pos,player)
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			if not inv:is_empty("fuel") then
				return false
			elseif not inv:is_empty("dst") then
				return false
			elseif not inv:is_empty("src") then
				return false
			end
			return true
		end,
		allow_metadata_inventory_put = function(pos, listname, index, stack, player)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			if listname == "fuel" then
				if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
					if inv:is_empty("src") then
						meta:set_string("infotext",name.." is empty")
					end
					return stack:get_count()
				else
					return 0
				end
			elseif listname == "src" then
				return stack:get_count()
			elseif listname == "dst" then
				return 0
			end
		end,
		allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			local stack = inv:get_stack(from_list, from_index)
			if to_list == "fuel" then
				if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
					if inv:is_empty("src") then
						meta:set_string("infotext",name.." is empty")
					end
					return count
				else
					return 0
				end
			elseif to_list == "src" then
				return count
			elseif to_list == "dst" then
				return 0
			end
		end,
	})

	minetest.register_abm({
		nodenames = {"lottcrafting:"..itemstring,"lottcrafting:"..itemstring.."_active"},
		interval = 1.0,
		chance = 1,
		action = function(pos, node, active_object_count, active_object_count_wider)
			local meta = minetest.get_meta(pos)
			for i, name in ipairs({
					"fuel_totaltime",
					"fuel_time",
					"src_totaltime",
					"src_time"
			}) do
				if meta:get_string(name) == "" then
					meta:set_float(name, 0.0)
				end
			end

			local inv = meta:get_inventory()

			local srclist = inv:get_list("src")
			local def = nil
			local time = 0

			if srclist then
				def = lottcrafting.get_craft_result(craft_type, 1, srclist)
			end

			if def then time = def.time end

			local was_active = false

			if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
				was_active = true
				meta:set_float("fuel_time", meta:get_float("fuel_time") + 1)
				meta:set_float("src_time", meta:get_float("src_time") + 1)
				if meta:get_float("src_time") >= time then
					-- FIXME: Add warning in chat if output can't be added?
					if def and def.outputs then lottcrafting.handle_craft(def, inv, "src", "dst") end
					meta:set_string("src_time", 0)
				end
			end

			if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
				local percent = math.floor(meta:get_float("fuel_time") /
						meta:get_float("fuel_totaltime") * 100)
				local item_percent = math.floor(meta:get_float("src_time") / time * 100)
				meta:set_string("infotext",name.." active: "..percent.."%")
				swap_node(pos,"lottcrafting:"..itemstring.."_active")
				meta:set_string("formspec",lottcrafting.get_furnace_active_formspec(pos, percent, item_percent))
				return
			end

			local fuel = nil
			local afterfuel
			local fuellist = inv:get_list("fuel")
			local srclist = inv:get_list("src")

			if srclist then
				def = lottcrafting.get_craft_result(craft_type, 1, srclist)
			end
			if fuellist then
				fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})
			end

			if not fuel or fuel.time <= 0 then
				meta:set_string("infotext",name.." out of fuel")
				swap_node(pos,"lottcrafting:"..itemstring)
				meta:set_string("formspec", lottcrafting.furnace_inactive_formspec)
				return
			end

			if not def then
				if was_active then
					meta:set_string("infotext",name.." is empty")
					swap_node(pos,"lottcrafting:"..itemstring)
					meta:set_string("formspec", lottcrafting.furnace_inactive_formspec)
				end
				return
			end

			meta:set_string("fuel_totaltime", fuel.time)
			meta:set_string("fuel_time", 0)

			inv:set_stack("fuel", 1, afterfuel.items[1])
		end,
	})
end

register_furnace("stove", "Stove", "stove")
register_furnace("forge", "Forge", "forge")
register_furnace("kiln", "Kiln", "kiln")
register_furnace("smelting_furnace", "Smelting Furnace", "smelting")

lottcrafting.register_craft("kiln", {
	inputs = {{"darkage:basalt_cobble"}},
	outputs = {"darkage:basalt"},
	time = 3,
})
