-- Normal Mallorn

minetest.register_node("lottflora:mallorntree", {
	description = "Mallorn Tree",
	tiles = {"tree_mallorn_top.png", "tree_mallorn_top.png", "tree_mallorn.png"},
	paramtype2 = "facedir",
	groups = {tree=1,choppy=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
	on_dig = function(pos, node, digger)
		default.dig_tree(pos, node, "lottflora:mallorntree", digger, 30, 5)
	end,
})

minetest.register_node("lottflora:mallorntree_young", {
	description = "Young Mallorn Trunk",
	tiles = {"tree_mallorn_top.png", "tree_mallorn_top.png", "tree_mallorn.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.1875, 0.125, 0.5, 0.1875},
			{-0.1875, -0.5, -0.125, 0.1875, 0.5, 0.125},
		},
	},
	paramtype2 = "facedir",
	groups = {tree=1,choppy=1,flammable=2,fuel=1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
	on_dig = function(pos, node, digger)
		default.dig_tree(pos, node, "lottflora:mallorntree_young", digger, 10, 1)
	end,
})

minetest.register_node("lottflora:mallorntree_young_grower", {
	description = "Young Mallorn Trunk",
	tiles = {"tree_mallorn_top.png", "tree_mallorn_top.png", "tree_mallorn.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.1875, 0.125, 0.5, 0.1875},
			{-0.1875, -0.5, -0.125, 0.1875, 0.5, 0.125},
		},
	},
	paramtype2 = "facedir",
	groups = {tree=1,choppy=1,flammable=2,fuel=1, not_in_creative_inventory=1,sapling=1},
	sounds = default.node_sound_wood_defaults(),
	drop = "lottflora:mallorntree_young",
	on_place = minetest.rotate_node,
	on_dig = function(pos, node, digger)
		default.dig_tree(pos, node, "lottflora:mallorntree_young", digger, 10, 1)
	end,
})

minetest.register_node("lottflora:mallorntree_grower", {
	description = "Mallorn Tree",
	tiles = {"tree_mallorn_top.png", "tree_mallorn_top.png", "tree_mallorn.png"},
	paramtype2 = "facedir",
	groups = {tree=1,choppy=1,flammable=2, not_in_creative_inventory=1,sapling=1},
	sounds = default.node_sound_wood_defaults(),
	drops = "lottflora:mallorntree",
	on_place = minetest.rotate_node,
	on_dig = function(pos, node, digger)
		default.dig_tree(pos, node, "lottflora:mallorntree", digger, 30, 5)
	end,
})


minetest.register_node("lottflora:mallornleaf", {
	description = "Mallorn Leaf",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"leaves_mallorn.png"},
	paramtype = "light",
	waving = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottflora:mallornsapling'},
				rarity = 20,
			},
			{
				items = {'lottflora:mallornleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:mallornsapling", {
	description = "Mallorn Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"sapling_mallorn.png"},
	inventory_image = "sapling_mallorn.png",
	wield_image = "sapling_mallorn.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2,sapling=1},
	sounds = default.node_sound_defaults(),
})

stairs.register_stair_and_slab("mallorntree", "lottflora:mallorntree",
		{choppy=1,flammable=2},
		{"tree_mallorn_top.png", "tree_mallorn_top.png", "tree_mallorn.png",
		"tree_mallorn.png", "tree_mallorn.png", "tree_mallorn_stair.png"},
		"Mallorn Tree Stair",
		"Mallorn Tree Slab",
		default.node_sound_wood_defaults())

function add_tree_branch_mallorn(pos)
	check_add_node(pos, {name="lottflora:mallorntree"})
	for i = math.floor(math.random(2)), -math.floor(math.random(2)), -1 do
		for k = math.floor(math.random(2)), -math.floor(math.random(2)), -1 do
			local p = {x=pos.x+i, y=pos.y, z=pos.z+k}
			check_add_node(p, {name="lottflora:mallornleaf"})
			local chance = math.abs(i+k)
			if (chance < 1) then
				p = {x=pos.x+i, y=pos.y+1, z=pos.z+k}
				check_add_node(p, {name="lottflora:mallornleaf"})
			end
		end
	end
end

function flora_mallorntree(pos)
    local height = 25 + math.random(5)
		if height < 10 then
			for i = height, -2, -1 do
				local p = {x=pos.x, y=pos.y+i, z=pos.z}
				check_add_node(p, {name="lottflora:mallorntree"})
				if i == height then
					add_tree_branch_mallorn({x=pos.x, y=pos.y+height+math.random(0, 1), z=pos.z})
					add_tree_branch_mallorn({x=pos.x+1, y=pos.y+i-math.random(2), z=pos.z})
					add_tree_branch_mallorn({x=pos.x-1, y=pos.y+i-math.random(2), z=pos.z})
					add_tree_branch_mallorn({x=pos.x, y=pos.y+i-math.random(2), z=pos.z+1})
					add_tree_branch_mallorn({x=pos.x, y=pos.y+i-math.random(2), z=pos.z-1})
				end
				if i < 0 then
					check_add_node({x=pos.x+1, y=pos.y+i-math.random(2), z=pos.z}, {name="lottflora:mallorntree"})
					check_add_node({x=pos.x, y=pos.y+i-math.random(2), z=pos.z+1}, {name="lottflora:mallorntree"})
					check_add_node({x=pos.x-1, y=pos.y+i-math.random(2), z=pos.z}, {name="lottflora:mallorntree"})
					check_add_node({x=pos.x, y=pos.y+i-math.random(2), z=pos.z-1}, {name="lottflora:mallorntree"})
				end
				if (math.sin(i/height*i) < 0.2 and i > 3 and math.random(0,2) < 1.5) then
					local branch_pos = {x=pos.x+math.random(0,1), y=pos.y+i, z=pos.z-math.random(0,1)}
					add_tree_branch_mallorn(branch_pos)
				end
			end
		else
			for i = height, -5, -1 do
				if (math.sin(i/height*i) < 0.2 and i > 3 and math.random(0,2) < 1.5) then
					local branch_pos = {x=pos.x+math.random(0,1), y=pos.y+i, z=pos.z-math.random(0,1)}
					add_tree_branch_mallorn(branch_pos)
				end
				if i < math.random(0,1) then
					check_add_node({x=pos.x+1, y=pos.y+i, z=pos.z+1}, {name="lottflora:mallorntree"})
					check_add_node({x=pos.x+2, y=pos.y+i, z=pos.z-1}, {name="lottflora:mallorntree"})
					check_add_node({x=pos.x, y=pos.y+i, z=pos.z-2}, {name="lottflora:mallorntree"})
					check_add_node({x=pos.x-1, y=pos.y+i, z=pos.z}, {name="lottflora:mallorntree"})
				end
				if i == height then
					add_tree_branch_mallorn({x=pos.x+1, y=pos.y+i, z=pos.z+1})
					add_tree_branch_mallorn({x=pos.x+2, y=pos.y+i, z=pos.z-1})
					add_tree_branch_mallorn({x=pos.x, y=pos.y+i, z=pos.z-2})
					add_tree_branch_mallorn({x=pos.x-1, y=pos.y+i, z=pos.z})
					add_tree_branch_mallorn({x=pos.x+1, y=pos.y+i, z=pos.z+2})
					add_tree_branch_mallorn({x=pos.x+3, y=pos.y+i, z=pos.z-1})
					add_tree_branch_mallorn({x=pos.x, y=pos.y+i, z=pos.z-3})
					add_tree_branch_mallorn({x=pos.x-2, y=pos.y+i, z=pos.z})
					add_tree_branch_mallorn({x=pos.x+1, y=pos.y+i, z=pos.z})
					add_tree_branch_mallorn({x=pos.x+1, y=pos.y+i, z=pos.z-1})
					add_tree_branch_mallorn({x=pos.x, y=pos.y+i, z=pos.z-1})
					add_tree_branch_mallorn({x=pos.x, y=pos.y+i, z=pos.z})
				else
					check_add_node({x=pos.x+1, y=pos.y+i, z=pos.z}, {name="lottflora:mallorntree"})
					check_add_node({x=pos.x+1, y=pos.y+i, z=pos.z-1}, {name="lottflora:mallorntree"})
					check_add_node({x=pos.x, y=pos.y+i, z=pos.z-1}, {name="lottflora:mallorntree"})
					check_add_node({x=pos.x, y=pos.y+i, z=pos.z}, {name="lottflora:mallorntree"})
				end
			end
		end
end

function flora_smallmallorntree(pos)
	for j = -3, 15 do
		if j == 11 or j == 15 then
			for i = -2, 2 do
			for k = -2, 2 do
				local absi = math.abs(i)
				local absk = math.abs(k)
				if math.random() > (absi + absk) / 24 then
					check_add_node({x=pos.x+i,y=pos.y+j+math.random(0, 1),z=pos.z+k},{name="lottflora:mallornleaf"})
				end
			end
			end
		end
	end
	for j = -3, 15 do
		check_add_node({x=pos.x,y=pos.y+j,z=pos.z},{name="lottflora:mallorntree"})
		if j == 0 then
			check_add_node({x=pos.x,y=pos.y+j,z=pos.z},{name="lottflora:mallorntree_grower"})
		end
	end
end

function flora_young_mallorn(pos)
	local t = 6 + math.random(1) -- trunk height
	for j = 0, t do
		if j == t or j == t - 2 then
			for i = -1, 1 do
			for k = -1, 1 do
				local absi = math.abs(i)
				local absk = math.abs(k)
				if math.random() > (absi + absk) / 24 then
					check_add_node({x=pos.x+i,y=pos.y+j+math.random(0, 1),z=pos.z+k},{name="lottflora:mallornleaf"})
				end
			end
			end
		end
		check_add_node({x=pos.x,y=pos.y+j,z=pos.z},{name="lottflora:mallorntree_young"})
		if j == 0 then
			check_add_node({x=pos.x,y=pos.y+j,z=pos.z},{name="lottflora:mallorntree_young_grower"})
		end
	end
end

minetest.register_abm({
    nodenames = {"lottflora:mallorntree_young_grower"},
    interval = 67,
    chance = 25,
    action = function(pos, node, active_object_count, active_object_count_wider)
		local na = minetest.get_node_or_nil({x = pos.x, y = pos.y + 1, z = pos.z})
		local naa = minetest.get_node_or_nil({x = pos.x, y = pos.y + 2, z = pos.z})
		if na.name == "lottflora:mallorntree_young" and naa.name == "lottflora:mallorntree_young" then
			if can_grow({x = pos.x, y = pos.y - 1, z = pos.z}) and
			can_grow({x = pos.x, y = pos.y - 2, z = pos.z}) and
			can_grow({x = pos.x, y = pos.y - 3, z = pos.z}) then
				local light_level = minetest.get_node_light(pos)
				if not light_level then
					return
				end
				local c = math.ceil(2 * (light_level - 13) ^ 2 + 1)
				if light_level > 7 and (math.random(1, c) == 1 or light_level >= 13) then
					flora_smallmallorntree(pos)
				end
			end
		end
    end,
})

minetest.register_abm({
	nodenames = {"lottflora:mallorntree_grower"},
	interval = 67,
	chance = 50,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local na = minetest.get_node_or_nil({x = pos.x, y = pos.y + 1, z = pos.z})
		local naa = minetest.get_node_or_nil({x = pos.x, y = pos.y + 2, z = pos.z})
		if na.name == "lottflora:mallorntree" and naa.name == "lottflora:mallorntree" then
			if large_roots(pos) ~= false then
				local light_level = minetest.get_node_light(pos)
				if not light_level then
					return
				end
				local c = math.ceil(2 * (light_level - 13) ^ 2 + 1)
				if light_level > 7 and (math.random(1, c) == 1 or light_level >= 13) then
					flora_mallorntree(pos)
				end
			end
		end
	end,
})

minetest.register_abm({
    nodenames = {"lottflora:mallornsapling"},
    interval = 67,
    chance = 11,
    action = function(pos, node, active_object_count, active_object_count_wider)
		local light_level = minetest.get_node_light(pos)
		if not light_level then
			return
		end
		local c = math.ceil(2 * (light_level - 13) ^ 2 + 1)
		if light_level > 7 and (math.random(1, c) == 1 or light_level >= 13) then
			flora_young_mallorn(pos)
		end
    end,
})

minetest.register_node("lottflora:mallornwood", {
	description = "Mallorn Planks",
	tiles = {"wood_mallorn.png"},
	groups = {choppy=1,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = 'lottflora:mallornwood 4',
	recipe = {
		{'lottflora:mallorntree'},
	}
})

minetest.register_craft({
	output = 'lottflora:mallornwood 2',
	recipe = {
		{'lottflora:mallorntree_young'},
	}
})
		
stairs.register_stair_and_slab("mallornwood", "lottflora:mallornwood",
		{choppy=1,flammable=3},
		{"wood_mallorn.png"},
		"Mallorn Wood Stair",
		"Mallorn Wood Slab",
		default.node_sound_wood_defaults())