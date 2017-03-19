minetest.register_craftitem("lottflora:berries_seed", {
	description = "Berries Seeds",
	inventory_image = "farming_berries_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return place_seed(itemstack, placer, pointed_thing, "lottflora:berries_1", 34)
	end,
})

minetest.register_node("lottflora:berries_1", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_berries_1.png"},
	waving = 1,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+5/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:berries_2", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_berries_2.png"},
	waving = 1,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+8/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:berries_3", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_berries_3.png"},
	waving = 1,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+13/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:berries_4", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_berries_4.png"},
	waving = 1,
	drop = {
		max_items = 6,
		items = {
			{ items = {'lottflora:berries_seed'} },
			{ items = {'lottflora:berries_seed'}, rarity = 2},
			{ items = {'lottflora:berries_seed'}, rarity = 5},
			{ items = {'lottflora:berries'} },
			{ items = {'lottflora:berries'}, rarity = 2 },
			{ items = {'lottflora:berries'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("lottflora:berries", {
	description = "Berries",
	inventory_image = "farming_berries.png",
	on_use = minetest.item_eat(1),
})

farming:add_plant("lottflora:berries_4", {"lottflora:berries_1", "lottflora:berries_2", "lottflora:berries_3"}, 50, 20, 34)
