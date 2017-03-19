minetest.register_node("lottflora:whiteleaf", {
	description = "White Leaf",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"leaves_white.png"},
	paramtype = "light",
	waving = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottflora:whitesapling'},
				rarity = 20,
			},
			{
				items = {'lottflora:whiteleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:whitesapling", {
	description = "White Tree Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"sapling_white.png"},
	inventory_image = "sapling_white.png",
	wield_image = "sapling_white.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2,sapling=1},
	sounds = default.node_sound_defaults(),
})

function flora_whitetree(pos)
	local t = 6 + math.random(2) -- trunk height
	for j = -2, t do
		if j == t or j == t - 2 or j == t - 4 then
			for i = -3, 3 do
			for k = -3, 3 do
				local absi = math.abs(i)
				local absk = math.abs(k)
				if math.random() > (absi + absk) / 24 then
					check_add_node({x=pos.x+i,y=pos.y+j+math.random(0, 1),z=pos.z+k},{name="lottflora:whiteleaf"})
				end
			end
			end
		end
		if j == t - 1 then
			for i = -2, 2 do
			for k = -2, 2 do
				if i == -1 and k == 0 or i == 1 and k == 0
				or k == 1 and i == 0 or k == -1 and i == 0
				or i == -2 and k == 0 or i == 2 and k == 0
				or k == 2 and i == 0 or k == -2 and i == 0 then
					check_add_node({x = pos.x + i, y = pos.y + j, z = pos.z}, {name="default:tree", param2 = 16})
					check_add_node({x = pos.x, y = pos.y + j, z = pos.z + k}, {name="default:tree", param2 = 10})
				end
			end
			end
		end
		check_add_node({x=pos.x,y=pos.y+j,z=pos.z}, {name="default:tree"})
	end
end

minetest.register_abm({
    nodenames = {"lottflora:whitesapling"},
    interval = 67,
    chance = 11,
    action = function(pos, node, active_object_count, active_object_count_wider)
		if can_grow({x = pos.x, y = pos.y - 1, z = pos.z}) and
		can_grow({x = pos.x, y = pos.y - 2, z = pos.z}) then
			local light_level = minetest.get_node_light(pos)
			if not light_level then
				return
			end
			local c = math.ceil(2 * (light_level - 13) ^ 2 + 1)
			if light_level > 7 and (math.random(1, c) == 1 or light_level >= 13) then
				flora_whitetree(pos)
			end
		end
    end,
})