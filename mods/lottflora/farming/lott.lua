farming = {}

function place_seed(itemstack, placer, pointed_thing, plantname, param2)
	local pt = pointed_thing
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end
	local under = minetest.get_node(pt.under)
	local above = minetest.get_node(pt.above)
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end
	if pt.above.y ~= pt.under.y+1 then
		return
	end
	if not minetest.registered_nodes[above.name].buildable_to then
		return
	end
	if minetest.get_item_group(under.name, "soil") <= 1 then
		return
	end
	minetest.add_node(pt.above, {name=plantname, param2=param2})
	if not minetest.setting_getbool("creative_mode") then
		itemstack:take_item()
	end
	return itemstack
end

function place_spore(itemstack, placer, pointed_thing, plantname, p2)
	local pt = pointed_thing
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end
	local under = minetest.get_node(pt.under)
	local above = minetest.get_node(pt.above)
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end
	if pt.above.y ~= pt.under.y+1 then
		return
	end
	if not minetest.registered_nodes[above.name].buildable_to then
		return
	end
	if minetest.get_item_group(under.name, "fungi") <= 1 then
		return
	end
	minetest.add_node(pt.above, {name=plantname, param2 = p2})
	if not minetest.setting_getbool("creative_mode") then
		itemstack:take_item()
	end
	return itemstack
end

function farming:add_plant(full_grown, names, interval, chance, p2)
	minetest.register_abm({
		nodenames = names,
		interval = interval,
		chance = chance,
		action = function(pos, node)
			pos.y = pos.y-1
			if minetest.get_node(pos).name ~= "lottflora:soil_wet" then
				return
			end
			pos.y = pos.y+1
			local light_level = minetest.get_node_light(pos)
			if not light_level then
				return
			end
			local c = math.ceil(2 * (light_level - 13) ^ 2 + 1)
			if light_level > 7 and (math.random(1, c) == 1 or light_level >= 13) then
				local step
				for i,name in ipairs(names) do
					if name == node.name then
						step = i
						break
					end
				end
				if not step then
					return
				end
				local new_node = {name=names[step+1], param2=p2}
				if new_node.name == nil then
					new_node.name = full_grown
				end
				minetest.set_node(pos, new_node)
			end
		end
})
end

-- ========= CORN =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/corn.lua")

-- ========= BERRIES =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/berries.lua")

-- ========= CABBAGE =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/cabbage.lua")

-- ========= ATHELAS =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/athelas.lua")

-- ========= POTATO =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/potato.lua")

-- ========= TOMATO =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/tomatoes.lua")

-- ========= TURNIP =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/turnips.lua")

-- ========= PIPEWEED =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/pipeweed.lua")

-- ========= MELON =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/melon.lua")

-- ========= BARLEY =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/barley.lua")

-- ========= CRAFTS =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/crafts.lua")

-- ========= BROWN MUSHROOM =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/brown.lua")

-- ========= RED MUSHROOM =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/red.lua")

-- ========= BLUE MUSHROOM =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/blue.lua")

-- ========= GREEN MUSHROOM =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/green.lua")

-- ========= WHITE MUSHROOM =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/white.lua")

-- ========= ORC FOOD =========
dofile(minetest.get_modpath("lottflora").."/farming/plants/orc_food.lua")
