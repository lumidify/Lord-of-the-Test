minetest.register_node("lottflora:pinetree", {
	description = "Pine Tree",
	tiles = {"tree_pine_top.png", "tree_pine_top.png", "tree_pine.png"},
	paramtype2 = "facedir",
	groups = {tree=1,choppy=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
	on_dig = function(pos, node, digger)
		default.dig_tree(pos, node, "lottflora:pinetree", digger, 13, 2)
	end,
})

minetest.register_node("lottflora:pineleaf", {
	description = "Pine Leaf",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"leaves_pine.png"},
	paramtype = "light",
	waving = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottflora:pinesapling'},
				rarity = 20,
			},
			{
				items = {'lottflora:pineleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:pinesapling", {
	description = "Pine Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"sapling_pine.png"},
	inventory_image = "sapling_pine.png",
	wield_image = "sapling_pine.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2,sapling=1},
	sounds = default.node_sound_defaults(),
})

stairs.register_stair_and_slab("pinetree", "lottflora:pinetree",
		{choppy=3,flammable=2},
		{"tree_pine_top.png", "tree_pine_top.png", "tree_pine.png",
		"tree_pine.png", "tree_pine.png", "tree_pine_stair.png"},
		"Pine Tree Stair",
		"Pine Tree Slab",
		default.node_sound_wood_defaults())

function flora_pinetree(pos)
	local t = 10 + math.random(3) -- trunk height
	for i = -2, 2 do
	for k = -2, 2 do
		local absi = math.abs(i)
		local absk = math.abs(k)
		if absi >= absk then
			j = t - absi
		else
			j = t - absk
		end
		if math.random() > (absi + absk) / 24 then
			check_add_node({x=pos.x+i,y=pos.y+j+1,z=pos.z+k},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-2,z=pos.z+k},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i+1,y=pos.y+j-2,z=pos.z+k},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i-1,y=pos.y+j-2,z=pos.z+k},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-2,z=pos.z+k+1},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-2,z=pos.z+k-1},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-5,z=pos.z+k},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i+1,y=pos.y+j-5,z=pos.z+k},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i-1,y=pos.y+j-5,z=pos.z+k},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-5,z=pos.z+k+1},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-5,z=pos.z+k-1},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-8,z=pos.z+k},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i+2,y=pos.y+j-8,z=pos.z+k},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i-2,y=pos.y+j-8,z=pos.z+k},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-8,z=pos.z+k+2},{name="lottflora:pineleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-8,z=pos.z+k-2},{name="lottflora:pineleaf"})
		end
	end
	end
	for j = -3, t do
		check_add_node({x=pos.x,y=pos.y+j,z=pos.z},{name="lottflora:pinetree"})
	end
end

minetest.register_abm({
    nodenames = {"lottflora:pinesapling"},
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
				flora_pinetree(pos)
			end
		end
    end,
})

minetest.register_node("lottflora:pinewood", {
	description = "Pine Planks",
	tiles = {"wood_pine.png"},
	groups = {choppy=3,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = 'lottflora:pinewood 4',
	recipe = {
		{'lottflora:pinetree'},
	}
})

stairs.register_stair_and_slab("pinewood", "lottflora:pinewood",
		{choppy=3,flammable=3},
		{"wood_pine.png"},
		"Pine Wood Stair",
		"Pine Wood Slab",
		default.node_sound_wood_defaults())