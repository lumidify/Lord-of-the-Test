minetest.register_craftitem("lottflora:cabbage_seed", {
	description = "Cabbage Seed",
	inventory_image = "farming_cabbage_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return place_seed(itemstack, placer, pointed_thing, "lottflora:cabbage_1")
	end,
})

minetest.register_node("lottflora:cabbage_1", {
	paramtype = "light",
	sunlight_propagates = true,
	drawtype = "nodebox",
	drop = "",
	tiles = {"farming_cabbage_top.png", "farming_cabbage_top.png", "farming_cabbage_side.png", "farming_cabbage_side.png", "farming_cabbage_side.png", "farming_cabbage_side.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.2, 0.2, -0.1, 0.2}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.2, 0.2, -0.1, 0.2}
		},
	},
	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("lottflora:cabbage_2", {
	paramtype = "light",
	sunlight_propagates = true,
	drawtype = "nodebox",
	drop = "",
	tiles = {"farming_cabbage_top.png", "farming_cabbage_top.png", "farming_cabbage_side.png", "farming_cabbage_side.png", "farming_cabbage_side.png", "farming_cabbage_side.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.35, -0.5, -0.35, 0.35, 0.2, 0.35}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.35, -0.5, -0.35, 0.35, 0.2, 0.35}
		},
	},
	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("lottflora:cabbage_3", {
	description = "Cabbage",
	paramtype2 = "facedir",
	tiles = {"farming_cabbage_top.png", "farming_cabbage_top.png", "farming_cabbage_side.png", "farming_cabbage_side.png", "farming_cabbage_side.png", "farming_cabbage_side.png"},
		drop = {
		max_items = 6,
		items = {
			{ items = {'lottflora:cabbage_seed'} },
			{ items = {'lottflora:cabbage_seed'}, rarity = 2},
			{ items = {'lottflora:cabbage_seed'}, rarity = 5},
			{ items = {'lottflora:cabbage'} },
			{ items = {'lottflora:cabbage'}, rarity = 2 },
			{ items = {'lottflora:cabbage'}, rarity = 5 }
		}
	},
	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=2, plant=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("lottflora:cabbage", {
	description = "Cabbage",
	paramtype2 = "facedir",
	tiles = {"farming_cabbage_top.png", "farming_cabbage_top.png", "farming_cabbage_side.png", "farming_cabbage_side.png", "farming_cabbage_side.png", "farming_cabbage_side.png"},
	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=2, plant=1, salad=1},
	sounds = default.node_sound_wood_defaults(),
     on_use = minetest.item_eat(4)
})

farming:add_plant("lottflora:cabbage_3", {"lottflora:cabbage_1", "lottflora:cabbage_2"}, 80, 20)

minetest.register_craft({
	output = 'lottflora:salad',
	recipe = {
		{'group:salad', 'group:salad', 'group:salad'},
		{'', 'lottflora:bowl', ''},
	}
})

minetest.register_craftitem("lottflora:salad", {
	description = "Salad",
	inventory_image = "farming_salad.png",
	on_use = minetest.item_eat(10),
})