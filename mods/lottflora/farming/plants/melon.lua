minetest.register_craftitem("lottflora:melon_seed", {
	description = "Melon Seed",
	inventory_image = "farming_melon_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return place_seed(itemstack, placer, pointed_thing, "lottflora:melon_1")
	end,
})

minetest.register_node("lottflora:melon_1", {
	paramtype = "light",
	sunlight_propagates = true,
	drawtype = "nodebox",
	drop = "",
	tiles = {"farming_melon_top.png", "farming_melon_top.png", "farming_melon_side.png", "farming_melon_side.png", "farming_melon_side.png", "farming_melon_side.png"},
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

minetest.register_node("lottflora:melon_2", {
	paramtype = "light",
	sunlight_propagates = true,
	drawtype = "nodebox",
	drop = "",
	tiles = {"farming_melon_top.png", "farming_melon_top.png", "farming_melon_side.png", "farming_melon_side.png", "farming_melon_side.png", "farming_melon_side.png"},
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

minetest.register_node("lottflora:melon_3", {
	description = "Melon",
	paramtype2 = "facedir",
	tiles = {"farming_melon_top.png", "farming_melon_top.png", "farming_melon_side.png", "farming_melon_side.png", "farming_melon_side.png", "farming_melon_side.png"},
		drop = {
		max_items = 6,
		items = {
			{ items = {'lottflora:melon_seed'} },
			{ items = {'lottflora:melon_seed'}, rarity = 20},
			{ items = {'lottflora:melon 8'} },
		}
	},
	groups = {choppy=2, oddly_breakable_by_hand=1, flammable=2, plant=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_alias("lottflora:melon_slice", "lottflora:melon")
minetest.register_craftitem("lottflora:melon", {
	description = "Melon",
	inventory_image = "farming_melon.png",
	on_use = minetest.item_eat(2),
})

farming:add_plant("lottflora:melon_3", {"lottflora:melon_1", "lottflora:melon_2"}, 80, 20)
