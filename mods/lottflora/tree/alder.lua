minetest.register_node("lottflora:aldertree", {
	description = "Alder Tree",
	tiles = {"tree_alder_top.png", "tree_alder_top.png", "tree_alder.png"},
	paramtype2 = "facedir",
	groups = {tree=1,choppy=2,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
	on_dig = function(pos, node, digger)
		default.dig_tree(pos, node, "lottflora:aldertree", digger, 10, 2)
	end,
})

minetest.register_node("lottflora:alderleaf", {
	description = "Alder Leaf",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"leaves_alder.png"},
	paramtype = "light",
	waving = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottflora:aldersapling'},
				rarity = 20,
			},
			{
				items = {'lottflora:alderleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:aldersapling", {
	description = "Alder Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"sapling_alder.png"},
	inventory_image = "sapling_alder.png",
	wield_image = "sapling_alder.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2,sapling=1},
	sounds = default.node_sound_defaults(),
})

stairs.register_stair_and_slab("aldertree", "lottflora:aldertree",
		{choppy=2,flammable=2},
		{"tree_alder_top.png", "tree_alder_top.png", "tree_alder.png",
		"tree_alder.png", "tree_alder.png", "tree_alder_stair.png"},
		"Alder Tree Stair",
		"Alder Tree Slab",
		default.node_sound_wood_defaults())
		
function flora_aldertree(pos)
	local t = 6 + math.random(2) -- trunk height
	for j = -2, t do
		if j == t or j == t - 2 then
			for i = -2, 2 do
			for k = -2, 2 do
				local absi = math.abs(i)
				local absk = math.abs(k)
				if math.random() > (absi + absk) / 24 then
					check_add_node({x=pos.x+i,y=pos.y+j+math.random(0, 1),z=pos.z+k},{name="lottflora:alderleaf"})
				end
			end
			end
		end
		check_add_node({x=pos.x,y=pos.y+j,z=pos.z},{name="lottflora:aldertree"})
	end
end

minetest.register_abm({
    nodenames = {"lottflora:aldersapling"},
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
				flora_aldertree(pos)
			end
		end
    end,
})

minetest.register_node("lottflora:alderwood", {
	description = "Alder Planks",
	tiles = {"wood_alder.png"},
	groups = {choppy=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = 'lottflora:alderwood 4',
	recipe = {
		{'lottflora:aldertree'},
	}
})

stairs.register_stair_and_slab("alderwood", "lottflora:alderwood",
		{choppy=2,flammable=3},
		{"wood_alder.png"},
		"Alder Wood Stair",
		"Alder Wood Slab",
		default.node_sound_wood_defaults())