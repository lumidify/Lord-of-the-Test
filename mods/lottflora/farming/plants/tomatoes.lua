minetest.register_craftitem("lottflora:tomatoes_seed", {
	description = "Tomato Seeds",
	inventory_image = "farming_tomatoes_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return place_seed(itemstack, placer, pointed_thing, "lottflora:tomatoes_1", 10)
	end,
})

minetest.register_node("lottflora:tomatoes_1", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_tomatoes_1.png"},
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

minetest.register_node("lottflora:tomatoes_2", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_tomatoes_2.png"},
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

minetest.register_node("lottflora:tomatoes_3", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_tomatoes_3.png"},
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

minetest.register_node("lottflora:tomatoes_4", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_tomatoes_4.png"},
	waving = 1,
	drop = {
		max_items = 6,
		items = {
			{ items = {'lottflora:tomatoes_seed'} },
			{ items = {'lottflora:tomatoes_seed'}, rarity = 2},
			{ items = {'lottflora:tomatoes_seed'}, rarity = 5},
			{ items = {'lottflora:tomatoes'} },
			{ items = {'lottflora:tomatoes'}, rarity = 2 },
			{ items = {'lottflora:tomatoes'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("lottflora:tomatoes", {
	description = "Tomato",
	inventory_image = "farming_tomatoes.png",
	on_use = minetest.item_eat(2),
	groups = {salad=1},
})

farming:add_plant("lottflora:tomatoes_4", {"lottflora:tomatoes_1", "lottflora:tomatoes_2", "lottflora:tomatoes_3"}, 50, 20, 10)

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "lottflora:tomatoes_cooked",
	recipe = "lottflora:tomatoes"
})

minetest.register_craftitem("lottflora:tomatoes_cooked", {
	description = "Cooked Tomato",
	inventory_image = "farming_tomatoes_cooked.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craftitem("lottflora:tomato_soup", {
	description = "Tomato Soup",
	inventory_image = "farming_tomato_soup.png",
	on_use = minetest.item_eat(10),
})

minetest.register_craft({
	output = 'lottflora:tomato_soup',
	recipe = {
		{'lottflora:tomatoes_cooked', 'lottflora:tomatoes_cooked', 'lottflora:tomatoes_cooked'},
		{'', 'lottflora:bowl', ''},
	}
})
