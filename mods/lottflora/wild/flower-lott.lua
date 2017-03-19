minetest.register_node("lottflora:anemones", {
	description = "Anemones",
	drawtype = "plantlike",
	tiles = { "flowers_anemones.png" },
	inventory_image = "flowers_anemones.png",
	wield_image = "flowers_anemones.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 40,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{ items = {'lottflora:honey'}, rarity = 20},
			{ items = {'lottflora:anemones'} },
		}
	},
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_blue=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})

minetest.register_node("lottflora:asphodel", {
	drawtype = "plantlike",
	tiles = { "flowers_asphodel.png" },
	inventory_image = "flowers_asphodel.png",
	wield_image = "flowers_asphodel.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 40,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{ items = {'lottflora:honey'}, rarity = 20},
			{ items = {'lottflora:asphodel'} },
		}
	},
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_white=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})

minetest.register_node("lottflora:eglantive", {
	description = "Eglantive",
	drawtype = "plantlike",
	tiles = { "flowers_eglantive.png" },
	inventory_image = "flowers_eglantive.png",
	wield_image = "flowers_eglantive.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 40,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{ items = {'lottflora:honey'}, rarity = 20},
			{ items = {'lottflora:eglantive'} },
		}
	},
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_pink=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})

minetest.register_node("lottflora:elanor", {
	drawtype = "plantlike",
	tiles = { "flowers_elanor.png" },
	inventory_image = "flowers_elanor.png",
	wield_image = "flowers_elanor.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 10,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{ items = {'lottflora:honey'}, rarity = 20},
			{ items = {'lottflora:elanor'} },
		}
	},
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_yellow=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})

minetest.register_node("lottflora:iris", {
	description = "Iris",
	drawtype = "plantlike",
	tiles = { "flowers_iris.png" },
	inventory_image = "flowers_iris.png",
	wield_image = "flowers_iris.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 40,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{ items = {'lottflora:honey'}, rarity = 20},
			{ items = {'lottflora:iris'}}
		}
	},
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_yellow=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})

minetest.register_node("lottflora:lissuin", {
	description = "Lissuin",
	drawtype = "plantlike",
	tiles = { "flowers_lissuin.png" },
	inventory_image = "flowers_lissuin.png",
	wield_image = "flowers_lissuin.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 41,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{ items = {'lottflora:honey'}, rarity = 20},
			{ items = {'lottflora:lissuin'} },
		}
	},
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_pink=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})

minetest.register_node("lottflora:mallos", {
	description = "Mallos",
	drawtype = "plantlike",
	tiles = { "flowers_mallos.png" },
	inventory_image = "flowers_mallos.png",
	wield_image = "flowers_mallos.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 42,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{ items = {'lottflora:honey'}, rarity = 20},
			{ items = {'lottflora:mallos'} },
		}
	},
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_yellow=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})

minetest.register_node("lottflora:niphredil", {
	description = "Niphredil",
	drawtype = "plantlike",
	tiles = { "flowers_niphredil.png" },
	inventory_image = "flowers_niphredil.png",
	wield_image = "flowers_niphredil.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 8,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{ items = {'lottflora:honey'}, rarity = 20},
			{ items = {'lottflora:niphredil'} },
		}
	},
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_brown=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})

minetest.register_node("lottflora:seregon", {
	description = "Seregon",
	drawtype = "plantlike",
	tiles = { "flowers_seregon.png" },
	inventory_image = "flowers_seregon.png",
	wield_image = "flowers_seregon.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 40,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 2,
		items = {
			{ items = {'lottflora:seregon'} },
			{ items = {'lottflora:honey'}, rarity = 20},
		}
	},
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_red=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})