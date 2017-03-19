minetest.register_craftitem("lottflora:athelas_seed", {
	description = "Athelas Seeds",
	inventory_image = "farming_athelas_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return place_seed(itemstack, placer, pointed_thing, "lottflora:athelas_1", 2)
	end,
})

minetest.register_node("lottflora:athelas_1", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_athelas_1.png"},
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

minetest.register_node("lottflora:athelas_2", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_athelas_2.png"},
	waving = 1,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+11/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:athelas_3", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_athelas_3.png"},
	waving = 1,
	drop = {
		max_items = 6,
		items = {
			{ items = {'lottflora:athelas_seed'} },
			{ items = {'lottflora:athelas_seed'}, rarity = 2},
			{ items = {'lottflora:athelas_seed'}, rarity = 5},
			{ items = {'lottflora:athelas'} },
			{ items = {'lottflora:athelas'}, rarity = 2 },
			{ items = {'lottflora:athelas'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("lottflora:athelas", {
	description = "Athelas",
	inventory_image = "farming_athelas_3.png",
})

farming:add_plant("lottflora:athelas_3", {"lottflora:athelas_1", "lottflora:athelas_2"}, 50, 20, 2)
