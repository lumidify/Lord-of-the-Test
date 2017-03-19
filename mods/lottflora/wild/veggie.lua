-- The wild plants drop food that can be eaten or crafted to get seeds

-- BARLEY

minetest.register_node("lottflora:barley_wild", {
	description = "Wild Barley",
	drawtype = "plantlike",
	tiles = { "farming_barley_3.png" },
	inventory_image = "farming_barley_3.png",
	wield_image = "farming_barley_3.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
	waving = 1,
	drop = {
		max_items = 3,
		items = {
			{ items = {'lottflora:barley'} },
			{ items = {'lottflora:barley'}, rarity = 5},
			{ items = {'lottflora:barley'}, rarity = 10}
		}
	},
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.3, -0.5, -0.3, 0.3, 0.3, 0.3 },
	},
})

-- BERRIES

minetest.register_node("lottflora:berries_wild", {
	description = "Wild Berries",
	drawtype = "plantlike",
	tiles = { "farming_berries_4.png" },
	inventory_image = "farming_berries_4.png",
	wield_image = "farming_berries_4.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 34,
	waving = 1,
	drop = {
		max_items = 3,
		items = {
			{ items = {'lottflora:berries'} },
			{ items = {'lottflora:berries'}, rarity = 5},
			{ items = {'lottflora:berries '}, rarity = 10}
		}
	},
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.25, 0.25, 0.2, 0.25 },
	},
})

--CORN

minetest.register_node("lottflora:corn_wild", {
	description = "Wild Corn plant",
	drawtype = "plantlike",
	tiles = { "farming_corn_32.png" },
	inventory_image = "farming_corn_32.png",
	wield_image = "farming_corn_32.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
	waving = 1,
	drop = {
		max_items = 3,
		items = {
			{ items = {'lottflora:corn'} },
			{ items = {'lottflora:corn'}, rarity = 5},
			{ items = {'lottflora:corn 9'}, rarity = 10}
		}
	},
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.4, -0.5, -0.4, 0.4, 0.3, 0.4 },
	},
})

-- CABBAGE

minetest.register_node("lottflora:cabbage_wild", {
	description = "Wild Cabbage",
	paramtype2 = "facedir",
	tiles = {"farming_cabbage_top.png", "farming_cabbage_top.png", "farming_cabbage_side.png", "farming_cabbage_side.png", "farming_cabbage_side.png", "farming_cabbage_side.png"},
	sunlight_propagates = true,
	paramtype = "light",
	drop = {
		max_items = 3,
		items = {
			{ items = {'lottflora:cabbage'} },
			{ items = {'lottflora:cabbage'}, rarity = 5},
			{ items = {'lottflora:cabbage'}, rarity = 10}
		}
	},
	groups = {snappy=3,flammable=2,flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

-- MELON

minetest.register_node("lottflora:melon_wild", {
	description = "Wild Melon",
	paramtype2 = "facedir",
	tiles = {"farming_melon_top.png", "farming_melon_top.png", "farming_melon_side.png", "farming_melon_side.png", "farming_melon_side.png", "farming_melon_side.png"},
	sunlight_propagates = true,
	paramtype = "light",
	drop = {
		max_items = 3,
		items = {
			{ items = {'lottflora:melon 3'} },
			{ items = {'lottflora:melon 6'}, rarity = 3},
			{ items = {'lottflora:melon 6'}, rarity = 8}
		}
	},
	groups = {snappy=3,flammable=2,flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

-- MUSHROOMS

minetest.register_node("lottflora:mushroom_wild", {
	description = "Mushroom Wild",
	drawtype = "plantlike",
	tiles = { "farming_brown_mushroom_4.png" },
	inventory_image = "farming_brown_mushroom_4.png",
	wield_image = "farming_brown_mushroom_4.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 9,
	waving = 1,
	drop = {
		max_items = 5,
		items = {
			{ items = {'lottflora:brown_mushroom'} },
			{ items = {'lottflora:red_mushroom'}, rarity = 5},
			{ items = {'lottflora:blue_mushroom'}, rarity = 10},
			{ items = {'lottflora:green_mushroom'}, rarity = 20},
			{ items = {'lottflora:white_mushroom'}, rarity = 20},
 			{ items = {'lottflora:brown_mushroom_spore'}, rarity = 5},
			{ items = {'lottflora:red_mushroom_spore'}, rarity = 10},
			{ items = {'lottflora:blue_mushroom_spore'}, rarity = 20},
			{ items = {'lottflora:green_mushroom_spore'}, rarity = 20},
			{ items = {'lottflora:white_mushroom_spore'}, rarity = 20}
		}
	},
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.3, -0.5, -0.3, 0.3, 0.35, 0.3 },
	},
})

-- PIPEWEED

minetest.register_node("lottflora:pipeweed_wild", {
	description = "Pipeweed Wild",
	drawtype = "plantlike",
	tiles = { "farming_pipeweed_4.png" },
	inventory_image = "farming_pipeweed_4.png",
	wield_image = "farming_pipeweed_4.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 34,
	waving = 1,
	drop = {
		max_items = 3,
		items = {
			{ items = {'lottflora:pipeweed'} },
			{ items = {'lottflora:pipeweed'}, rarity = 5},
			{ items = {'lottflora:pipeweed'}, rarity = 10}
		}
	},
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.2, -0.5, -0.2, 0.2, 0.3, 0.2 },
	},
})

-- POTATO

minetest.register_node("lottflora:potato_wild", {
	description = "Potato Wild",
	drawtype = "plantlike",
	tiles = { "farming_potato_3.png" },
	inventory_image = "farming_potato_3.png",
	wield_image = "farming_potato_3.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 40,
	waving = 1,
	drop = {
		max_items = 3,
		items = {
			{ items = {'lottflora:potato'} },
			{ items = {'lottflora:potato'}, rarity = 5},
			{ items = {'lottflora:potato'}, rarity = 10}
		}
	},
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.2, -0.5, -0.2, 0.2, 0.2, 0.2 },
	},
})

-- TOMATOES

minetest.register_node("lottflora:tomatoes_wild", {
	description = "Wild Tomatoes",
	drawtype = "plantlike",
	tiles = { "farming_tomatoes_4.png" },
	inventory_image = "farming_tomatoes_4.png",
	wield_image = "farming_tomatoes_4.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 10,
	waving = 1,
	drop = {
		max_items = 3,
		items = {
			{ items = {'lottflora:tomatoes'} },
			{ items = {'lottflora:tomatoes'}, rarity = 5},
			{ items = {'lottflora:tomatoes'}, rarity = 10}
		}
	},
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.35, -0.5, -0.35, 0.35, 0.25, 0.35 },
	},
})

-- TURNIPS

minetest.register_node("lottflora:turnips_wild", {
	description = "Wild Turnips",
	drawtype = "plantlike",
	tiles = { "farming_turnips_4.png" },
	inventory_image = "farming_turnips_4.png",
	wield_image = "farming_turnips_4.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 40,
	waving = 1,
	drop = {
		max_items = 3,
		items = {
			{ items = {'lottflora:turnips'} },
			{ items = {'lottflora:turnips'}, rarity = 10 },
			{ items = {'lottflora:turnips'}, rarity = 5}
		}
	},
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.2, -0.5, -0.2, 0.2, 0.2, 0.2 },
	},
})
