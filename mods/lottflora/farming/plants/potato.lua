minetest.register_craftitem("lottflora:potato_seed", {
	description = "Potato Seeds",
	inventory_image = "farming_potato_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return place_seed(itemstack, placer, pointed_thing, "lottflora:potato_1", 40)
	end,
})

minetest.register_node("lottflora:potato_1", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_potato_1.png"},
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

minetest.register_node("lottflora:potato_2", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_potato_2.png"},
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

minetest.register_node("lottflora:potato_3", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_potato_3.png"},
	waving = 1,
	drop = {
		max_items = 6,
		items = {
			{ items = {'lottflora:potato_seed'} },
			{ items = {'lottflora:potato_seed'}, rarity = 2},
			{ items = {'lottflora:potato_seed'}, rarity = 5},
			{ items = {'lottflora:potato'} },
			{ items = {'lottflora:potato'}, rarity = 2 },
			{ items = {'lottflora:potato'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("lottflora:potato", {
	description = "Potato",
	inventory_image = "farming_potato.png",
	on_use = minetest.item_eat(1),
})

farming:add_plant("lottflora:potato_3", {"lottflora:potato_1", "lottflora:potato_2"}, 50, 20, 40)

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "lottflora:potato_cooked",
	recipe = "lottflora:potato"
})

minetest.register_craftitem("lottflora:potato_cooked", {
	description = "Cooked Potato",
	inventory_image = "farming_potato_cooked.png",
	on_use = minetest.item_eat(5),
})
