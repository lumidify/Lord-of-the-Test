minetest.register_node("lottflora:rowanleaf", {
	description = "Rowan Leaf",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"leaves_rowan.png"},
	paramtype = "light",
	waving = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
    drop = {
	    	max_items = 1,
		    items = {
		    	{ items = {'lottflora:rowansapling'}, rarity = 20 },
		    	{ items = {'lottflora:berries'}, rarity = 200 },
		    	{ items = {'lottflora:rowanleaf'} },
		    }
	    },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:rowanberry", {
	description = "Rowan Leaf with Berries",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"leaves_rowan.png^leaves_rowanberry.png"},
	paramtype = "light",
	waving = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
    drop = {
	    	max_items = 2,
		    items = {
		          { items = {'lottflora:rowanleaf'} },
		    	  { items = {'lottflora:berries'} },
		    }
	    },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:rowansapling", {
	description = "Rowan Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"sapling_rowan.png"},
	inventory_image = "sapling_rowan.png",
	wield_image = "sapling_rowan.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2,sapling=1},
	sounds = default.node_sound_defaults(),
})

function flora_rowantree(pos)
	local t = 4 + math.random(2) -- trunk height
	for j = -2, t do
		if j == t or j == t - 2 then
			for i = -2, 2 do
			for k = -2, 2 do
				local absi = math.abs(i)
				local absk = math.abs(k)
				if math.random() > (absi + absk) / 12 then
					check_add_node({x=pos.x+i,y=pos.y+j+math.random(0, 1),z=pos.z+k},{name="lottflora:rowanleaf"})
				end
			end
			end
		end
		check_add_node({x=pos.x,y=pos.y+j,z=pos.z},{name="default:tree"})
	end
end

minetest.register_abm({
    nodenames = {"lottflora:rowansapling"},
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
			print(light_level, c)
			if light_level > 7 and (math.random(1, c) == 1 or light_level >= 13) then
				flora_rowantree(pos)
			end
		end
    end,
})
