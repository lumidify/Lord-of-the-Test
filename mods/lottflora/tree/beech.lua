minetest.register_node("lottflora:beechleaf", {
	description = "Beech Leaf",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"leaves_beech.png"},
	paramtype = "light",
	waving = 1,
	groups = {snappy=3, flammable=2},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottflora:beechsapling'},
				rarity = 20,
			},
			{
				items = {'lottflora:beechleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:beechsapling", {
	description = "Beech Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"sapling_beech.png"},
	inventory_image = "sapling_beech.png",
	wield_image = "sapling_beech.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2,sapling=1},
	sounds = default.node_sound_defaults(),
})

function flora_beechtree(pos)
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
		    check_add_node({x=pos.x+i,y=pos.y+j+7,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j+4,z=pos.z+k},{name="lottflora:beechleaf"})
		    check_add_node({x=pos.x+i+2,y=pos.y+j+4,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i-2,y=pos.y+j+4,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j+4,z=pos.z+k+2},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j+4,z=pos.z+k-2},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j+1,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i+3,y=pos.y+j+1,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i-3,y=pos.y+j+1,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j+1,z=pos.z+k+3},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j+1,z=pos.z+k-3},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-2,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i+3,y=pos.y+j-2,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i-3,y=pos.y+j-2,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-2,z=pos.z+k+3},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-2,z=pos.z+k-3},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-5,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i+4,y=pos.y+j-5,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i-4,y=pos.y+j-5,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-5,z=pos.z+k+4},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-5,z=pos.z+k-4},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-8,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i+4,y=pos.y+j-8,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i-4,y=pos.y+j-8,z=pos.z+k},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-8,z=pos.z+k+4},{name="lottflora:beechleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-8,z=pos.z+k-4},{name="lottflora:beechleaf"})
		end
	end
	end
	for j = -3, t do
		check_add_node({x=pos.x,y=pos.y+j,z=pos.z},{name="default:tree"})
	end
end

minetest.register_abm({
    nodenames = {"lottflora:beechsapling"},
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
				flora_beechtree(pos)
			end
		end
    end,
})