-- ITEMS and TOOLS

minetest.register_craft({
	output = "lottflora:bowl",
	recipe = {
		{"default:wood", "", "default:wood"},
		{"", "default:wood", ""},
		{"", "", ""},
	}
})

minetest.register_craftitem("lottflora:bowl", {
	description = "Bowl",
	inventory_image = "farming_bowl.png",
})

minetest.register_node("lottflora:decay_tree", {
	description = "Decaying Wood",
	tiles = {'default_tree_top.png^farming_decay_tree.png', 'default_tree.png', 	'default_tree.png'},
     is_ground_content = true,
	groups = {crumbly=3, fungi=3},
	sounds = default.node_sound_dirt_defaults(),
	drop = "default:dirt",
})

minetest.register_craft({
	output = 'lottflora:pipe',
	recipe = {
		{'', '', 'group:stick'},
		{'group:wood', 'group:stick', ''},
		{'group:stick', '', ''},
	}
})

-- SOUPS and SALADS

minetest.register_craft({
	output = 'lottflora:mushroom_soup',
	recipe = {
		{'group:mushroom', 'group:mushroom', 'group:mushroom'},
		{'', 'lottflora:bowl', ''},
	}
})

minetest.register_craft({
	output = 'lottflora:salad',
	recipe = {
		{'group:salad', 'group:salad', 'group:salad'},
		{'', 'lottflora:bowl', ''},
	}
})

-- SEEDS

minetest.register_craft({
	output = 'lottflora:athelas_seed 2',
	recipe = {
		{'lottflora:athelas'},
	}
})

minetest.register_craft({
	output = 'lottflora:barley_seed 2',
	recipe = {
		{'lottflora:barley'},
	}
})

minetest.register_craft({
	output = 'lottflora:berries_seed 2',
	recipe = {
		{'lottflora:berries'},
	}
})

minetest.register_craft({
	output = 'lottflora:cabbage_seed 2',
	recipe = {
		{'lottflora:cabbage'},
	}
})

minetest.register_craft({
	output = 'lottflora:corn_seed 2',
	recipe = {
		{'lottflora:corn'},
	}
})

minetest.register_craft({
	output = 'lottflora:tomatoes_seed 2',
	recipe = {
		{'lottflora:tomatoes'},
	}
})

minetest.register_craft({
	output = 'lottflora:melon_seed 2',
	recipe = {
		{'lottflora:melon'},
	}
})

minetest.register_craft({
	output = 'lottflora:potato_seed 2',
	recipe = {
		{'lottflora:potato'},
	}
})

minetest.register_craft({
	output = 'lottflora:pipeweed_seed 2',
	recipe = {
		{'lottflora:pipeweed'},
	}
})
minetest.register_craft({
	output = 'lottflora:turnips_seed 2',
	recipe = {
		{'lottflora:turnips'},
	}
})

-- FOOD

minetest.register_craft({
	output = 'lottflora:melon',
	recipe = {
		{'lottflora:melon_slice', 'lottflora:melon_slice', 'lottflora:melon_slice'},
		{'lottflora:melon_slice', 'lottflora:melon_slice', 'lottflora:melon_slice'},
		{'lottflora:melon_slice', 'lottflora:melon_slice', 'lottflora:melon_slice'},
	}
})
