minetest.register_craftitem("lottflora:pipeweed_seed", {
	description = "Pipeweed Seeds",
	inventory_image = "farming_pipeweed_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return place_seed(itemstack, placer, pointed_thing, "lottflora:pipeweed_1", 34)
	end,
})

minetest.register_node("lottflora:pipeweed_1", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_pipeweed_1.png"},
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

minetest.register_node("lottflora:pipeweed_2", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_pipeweed_2.png"},
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

minetest.register_node("lottflora:pipeweed_3", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_pipeweed_3.png"},
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

minetest.register_node("lottflora:pipeweed_4", {
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_pipeweed_4.png"},
	waving = 1,
	drop = {
		max_items = 6,
		items = {
			{ items = {'lottflora:pipeweed_seed'} },
			{ items = {'lottflora:pipeweed_seed'}, rarity = 2},
			{ items = {'lottflora:pipeweed_seed'}, rarity = 5},
			{ items = {'lottflora:pipeweed'} },
			{ items = {'lottflora:pipeweed'}, rarity = 2 },
			{ items = {'lottflora:pipeweed'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("lottflora:pipeweed", {
	description = "Pipeweed",
	inventory_image = "farming_pipeweed.png",
})

farming:add_plant("lottflora:pipeweed_4", {"lottflora:pipeweed_1", "lottflora:pipeweed_2", "lottflora:pipeweed_3"}, 50, 20, 34)

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "lottflora:pipeweed_cooked",
	recipe = "lottflora:pipeweed"
})

minetest.register_craftitem("lottflora:pipeweed_cooked", {
	description = "Cooked Pipeweed",
	inventory_image = "farming_pipeweed_cooked.png",
})
