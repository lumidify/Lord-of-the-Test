minetest.register_alias("lottmapgen:mirkleaves", "lottflora:mirkleaf")
minetest.register_node("lottflora:mirkleaf", {
	description = "Mirkwood Leaves",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"leaves_mirk.png"},
	paramtype = "light",
	sunlight_propagates = false,
	waving = 1,
	is_ground_content = false,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottflora:mirksapling'},
				rarity = 20,
			},
			{
				items = {'lottflora:mirkleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:mirksapling", {
	description = "Mirkwood Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"sapling_mirk.png"},
	inventory_image = "sapling_mirk.png",
	wield_image = "sapling_mirk.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2,sapling=1},
	sounds = default.node_sound_defaults(),
})

--Mirk large

function add_tree_branch_mirktree(pos)
	check_add_node(pos, {name="default:jungletree"})
	for i = math.floor(math.random(2)), -math.floor(math.random(2)), -1 do
		for k = math.floor(math.random(2)), -math.floor(math.random(2)), -1 do
			local p = {x=pos.x+i, y=pos.y, z=pos.z+k}
			local n = minetest.get_node(p)
			if (n.name=="air") then
				check_add_node(p, {name="lottflora:mirkleaf"})
			end
			local chance = math.abs(i+k)
			if (chance < 1) then
				p = {x=pos.x+i, y=pos.y+1, z=pos.z+k}
				n = minetest.get_node(p)
				if (n.name=="air") then
					check_add_node(p, {name="lottflora:mirkleaf"})
				end
			end
		end
	end
end

function flora_mirktree(pos)
    local height = 5 + math.random(1)
		if height < 1 then
			for i = height, -2, -1 do
				local p = {x=pos.x, y=pos.y+i, z=pos.z}
				check_add_node(p, {name="default:jungletree"})
				if i == height then
					add_tree_branch_mirktree({x=pos.x, y=pos.y+height+math.random(0, 1), z=pos.z})
					add_tree_branch_mirktree({x=pos.x+1, y=pos.y+i-math.random(2), z=pos.z})
					add_tree_branch_mirktree({x=pos.x-1, y=pos.y+i-math.random(2), z=pos.z})
					add_tree_branch_mirktree({x=pos.x, y=pos.y+i-math.random(2), z=pos.z+1})
					add_tree_branch_mirktree({x=pos.x, y=pos.y+i-math.random(2), z=pos.z-1})
				end
				if i < 0 then
					check_add_node({x=pos.x+1, y=pos.y+i-math.random(2), z=pos.z}, {name="default:jungletree"})
					check_add_node({x=pos.x, y=pos.y+i-math.random(2), z=pos.z+1}, {name="default:jungletree"})
					check_add_node({x=pos.x-1, y=pos.y+i-math.random(2), z=pos.z}, {name="default:jungletree"})
					check_add_node({x=pos.x, y=pos.y+i-math.random(2), z=pos.z-1}, {name="default:jungletree"})
				end
				if (math.sin(i/height*i) < 0.2 and i > 3 and math.random(0,2) < 1.5) then
					local branch_pos = {x=pos.x+math.random(0,1), y=pos.y+i, z=pos.z-math.random(0,1)}
					add_tree_branch_mirktree(branch_pos)
				end
			end
		else
			for i = height, -5, -1 do
				if (math.sin(i/height*i) < 0.2 and i > 3 and math.random(0,2) < 1.5) then
					local branch_pos = {x=pos.x+math.random(0,1), y=pos.y+i, z=pos.z-math.random(0,1)}
					add_tree_branch_mirktree(branch_pos)
				end
				if i < math.random(0,1) then
					check_add_node({x=pos.x+1, y=pos.y+i, z=pos.z+1}, {name="default:jungletree"})
					check_add_node({x=pos.x+2, y=pos.y+i, z=pos.z-1}, {name="default:jungletree"})
					check_add_node({x=pos.x, y=pos.y+i, z=pos.z-2}, {name="default:jungletree"})
					check_add_node({x=pos.x-1, y=pos.y+i, z=pos.z}, {name="default:jungletree"})
				end
				if i == height then
					add_tree_branch_mirktree({x=pos.x+1, y=pos.y+i, z=pos.z+1})
					add_tree_branch_mirktree({x=pos.x+2, y=pos.y+i, z=pos.z-1})
					add_tree_branch_mirktree({x=pos.x, y=pos.y+i, z=pos.z-2})
					add_tree_branch_mirktree({x=pos.x-1, y=pos.y+i, z=pos.z})
					add_tree_branch_mirktree({x=pos.x+1, y=pos.y+i, z=pos.z+2})
					add_tree_branch_mirktree({x=pos.x+3, y=pos.y+i, z=pos.z-1})
					add_tree_branch_mirktree({x=pos.x, y=pos.y+i, z=pos.z-3})
					add_tree_branch_mirktree({x=pos.x-2, y=pos.y+i, z=pos.z})
					add_tree_branch_mirktree({x=pos.x+1, y=pos.y+i, z=pos.z})
					add_tree_branch_mirktree({x=pos.x+1, y=pos.y+i, z=pos.z-1})
					add_tree_branch_mirktree({x=pos.x, y=pos.y+i, z=pos.z-1})
					add_tree_branch_mirktree({x=pos.x, y=pos.y+i, z=pos.z})
				else
					check_add_node({x=pos.x+1, y=pos.y+i, z=pos.z}, {name="default:jungletree"})
					check_add_node({x=pos.x+1, y=pos.y+i, z=pos.z-1}, {name="default:jungletree"})
					check_add_node({x=pos.x, y=pos.y+i, z=pos.z-1}, {name="default:jungletree"})
					check_add_node({x=pos.x, y=pos.y+i, z=pos.z}, {name="default:jungletree"})
				end
			end
		end
end

--Mirk Small

function flora_smallmirktree(pos)
	for j = -3, 7 do
		if j == 6 then
			for i = -4, 4 do
			for k = -4, 4 do
				if math.random(20) ~= 10 then
					check_add_node({x=pos.x+i,y=pos.y+j+math.random(1, 2),z=pos.z+k},{name="lottflora:mirkleaf"})
				end
			end
			end
			for i = -1, 1, 2 do
			for k = -1, 1, 2 do
				check_add_node({x=pos.x+i,y=pos.y+j,z=pos.z+k},{name="default:jungletree"})
			end
			end
		elseif j == 7 then
			for i = -2, 2, 4 do
			for k = -2, 2, 4 do
				check_add_node({x=pos.x+i,y=pos.y+j,z=pos.z+k},{name="default:jungletree"})
			end
			end
		else
			check_add_node({x=pos.x,y=pos.y+j,z=pos.z},{name="default:jungletree"})
		end
	end
end

minetest.register_abm({
    nodenames = {"lottflora:mirksapling"},
    interval = 67,
    chance = 11,
    action = function(pos, node, active_object_count, active_object_count_wider)
		if math.random(2) == 1 and large_roots(pos) then
			local light_level = minetest.get_node_light(pos)
			if not light_level then
				return
			end
			local c = math.ceil(2 * (light_level - 13) ^ 2 + 1)
			if light_level > 7 and (math.random(1, c) == 1 or light_level >= 13) then
				flora_mirktree(pos)
			end
		else
			if can_grow({x = pos.x, y = pos.y - 1, z = pos.z}) and
			can_grow({x = pos.x, y = pos.y - 2, z = pos.z}) and
			can_grow({x = pos.x, y = pos.y - 3, z = pos.z}) then
				local light_level = minetest.get_node_light(pos)
				if not light_level then
					return
				end
				local c = math.ceil(2 * (light_level - 13) ^ 2 + 1)
				if light_level > 7 and (math.random(1, c) == 1 or light_level >= 13) then
					flora_smallmirktree(pos)
				end
			end
		end
    end,
})