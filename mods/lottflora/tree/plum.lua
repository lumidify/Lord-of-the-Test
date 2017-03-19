minetest.register_node("lottflora:plumleaf", {
	description = "Plum Leaf",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"leaves_plum.png"},
	paramtype = "light",
	waving = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottflora:plumsapling'},
				rarity = 20,
			},
			{
				items = {'lottflora:plumleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:plum", {
	description = "Plum",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"fruit_plum.png"},
	inventory_image = "fruit_plum.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {fleshy=3,dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="lottflora:plum", param2=1})
		end
	end,
})

minetest.register_node("lottflora:plumsapling", {
	description = "Plum Tree Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"sapling_plum.png"},
	inventory_image = "sapling_plum.png",
	wield_image = "sapling_plum.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2,sapling=1},
	sounds = default.node_sound_defaults(),
})

function flora_plumtree(pos)
	local t = 3 + math.random(2) -- trunk height
	for j = -2, t do
		if j == t or j == t - 2 then
			for i = -2, 2 do
			for k = -2, 2 do
				local absi = math.abs(i)
				local absk = math.abs(k)
				if math.random() > (absi + absk) / 24 then
					check_add_node({x=pos.x+i,y=pos.y+j+math.random(0, 1),z=pos.z+k},{name="lottflora:plumleaf"})
				end
				if math.random() > (absi + absk) / 2 then
					check_add_node({x=pos.x+i,y=pos.y+j+math.random(0, 1),z=pos.z+k},{name="lottflora:plum"})
				end
			end
			end
		end
		if j ~= t then
			check_add_node({x=pos.x,y=pos.y+j,z=pos.z},{name="default:tree"})
		end
	end
end

minetest.register_abm({
    nodenames = {"lottflora:plumsapling"},
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
				flora_plumtree(pos)
			end
		end
    end,
})