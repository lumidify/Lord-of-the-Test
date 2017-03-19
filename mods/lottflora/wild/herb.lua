minetest.register_node("lottflora:athelas_wild", {
	description = "Athelas",
	drawtype = "plantlike",
	tiles = { "farming_athelas_3.png" },
	inventory_image = "farming_athelas_3.png",
	wield_image = "farming_athelas_3.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 2,
	waving = 1,
	drop = {
		max_items = 3,
		items = {
			{ items = {'lottflora:athelas'} },
			{ items = {'lottflora:athelas'}, rarity = 5},
		}
	},
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})