minetest.register_craftitem("lottflora:turnips_seed", {
	description = "Turnip Seeds",
	inventory_image = "farming_turnips_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return place_seed(itemstack, placer, pointed_thing, "lottflora:turnips_1", 40)
	end,
})

minetest.register_node("lottflora:turnips_1", {
	paramtype = "light",
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_turnips_1.png"},
	waving = 1,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+3/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:turnips_2", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_turnips_2.png"},
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

minetest.register_node("lottflora:turnips_3", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_turnips_3.png"},
	waving = 1,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+12/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottflora:turnips_4", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_turnips_4.png"},
	waving = 1,
	drop = {
		max_items = 6,
		items = {
			{ items = {'lottflora:turnips_seed'} },
			{ items = {'lottflora:turnips_seed'}, rarity = 2},
			{ items = {'lottflora:turnips_seed'}, rarity = 5},
			{ items = {'lottflora:turnips'} },
			{ items = {'lottflora:turnips'}, rarity = 2 },
			{ items = {'lottflora:turnips'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("lottflora:turnips", {
	description = "Turnips",
	inventory_image = "farming_turnips.png",
	on_use = minetest.item_eat(2),
})

farming:add_plant("lottflora:turnips_4", {"lottflora:turnips_1", "lottflora:turnips_2", "lottflora:turnips_3"}, 50, 20, 40)

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "lottflora:turnips_cooked",
	recipe = "lottflora:turnips"
})

minetest.register_craftitem("lottflora:turnips_cooked", {
	description = "Cooked Turnips",
	inventory_image = "farming_turnips_cooked.png",
	on_use = minetest.item_eat(2),
})
