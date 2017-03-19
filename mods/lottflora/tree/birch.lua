minetest.register_node("lottflora:birchtree", {
	description = "Birch Tree",
	tiles = {"tree_birch_top.png", "tree_birch_top.png", "tree_birch.png"},
	paramtype2 = "facedir",
	groups = {tree=1,choppy=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
	on_dig = function(pos, node, digger)
		default.dig_tree(pos, node, "lottflora:birchtree", digger, 12, 3)
	end,
})

minetest.register_node("lottflora:birchleaf", {
	description = "Birch Leaf",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"leaves_birch.png"},
	paramtype = "light",
	waving = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottflora:birchsapling'},
				rarity = 20,
			},
			{
				items = {'lottflora:birchleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:birchsapling", {
	description = "Birch Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"sapling_birch.png"},
	inventory_image = "sapling_birch.png",
	wield_image = "sapling_birch.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2,sapling=1},
	sounds = default.node_sound_defaults(),
})

stairs.register_stair_and_slab("birchtree", "lottflora:birchtree",
		{choppy=3,flammable=2},
		{"tree_birch_top.png", "tree_birch_top.png", "tree_birch.png",
		"tree_birch.png", "tree_birch.png", "tree_birch_stair.png"},
		"Birch Tree Stair",
		"Birch Tree Slab",
		default.node_sound_wood_defaults())

function flora_birchtree(pos)
	local t = 7 + math.random(5) -- trunk height
	for j = -3, t do
		if j == math.floor(t * 0.7) or j == t then
			for i = -2, 2 do
			for k = -2, 2 do
				local absi = math.abs(i)
				local absk = math.abs(k)
				if math.random() > (absi + absk) / 24 then
					check_add_node({x=pos.x+i,y=pos.y+j+math.random(0, 1),z=pos.z+k},{name="lottflora:birchleaf"})
				end
			end
			end
		end
		check_add_node({x=pos.x,y=pos.y+j,z=pos.z},{name="lottflora:birchtree"})
	end
end

minetest.register_abm({
    nodenames = {"lottflora:birchsapling"},
    interval = 67,
    chance = 11,
    action = function(pos, node, active_object_count, active_object_count_wider)
		if can_grow({x = pos.x, y = pos.y - 1, z = pos.z}) and
		can_grow({x = pos.x, y = pos.y - 2, z = pos.z}) and
		can_grow({x = pos.x, y = pos.y - 3, z = pos.z}) then
			local light_level = minetest.get_node_light(pos)
			if not light_level then
				return
			end
			local c = math.ceil(2 * (light_level - 13) ^ 2 + 1)
			if light_level > 7 and (math.random(1, c) == 1 or light_level >= 13) then
				flora_birchtree(pos)
			end
		end
    end,
})

minetest.register_node("lottflora:birchwood", {
	description = "Birch Planks",
	tiles = {"wood_birch.png"},
	groups = {choppy=3,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = 'lottflora:birchwood 4',
	recipe = {
		{'lottflora:birchtree'},
	}
})

stairs.register_stair_and_slab("birchwood", "lottflora:birchwood",
		{choppy=3,flammable=3},
		{"wood_birch.png"},
		"Birch Wood Stair",
		"Birch Wood Slab",
		default.node_sound_wood_defaults())