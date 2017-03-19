minetest.register_craftitem("lottflora:barley_seed", {
	description = "Barley Seeds",
	inventory_image = "farming_barley_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return place_seed(itemstack, placer, pointed_thing, "lottflora:barley_1", 3)
	end,
})

minetest.register_node("lottflora:barley_1", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_barley_1.png"},
	waving = 1,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+6/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:barley_2", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_barley_2.png"},
	waving = 1,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+9/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:barley_3", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_barley_3.png"},
	waving = 1,
	drop = {
		max_items = 6,
		items = {
			{ items = {'lottflora:barley_seed'} },
			{ items = {'lottflora:barley_seed'}, rarity = 2},
			{ items = {'lottflora:barley_seed'}, rarity = 5},
			{ items = {'lottflora:barley'} },
			{ items = {'lottflora:barley'}, rarity = 2 },
			{ items = {'lottflora:barley'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("lottflora:barley", {
	description = "Barley",
	inventory_image = "farming_barley_3.png",
})

farming:add_plant("lottflora:barley_3", {"lottflora:barley_1", "lottflora:barley_2"}, 50, 20, 3)

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "lottflora:barley_cooked",
	recipe = "lottflora:barley"
})

minetest.register_craftitem("lottflora:barley_cooked", {
	description = "Cooked Barley",
	inventory_image = "farming_barley_cooked.png",
	on_use = minetest.item_eat(2),
})
