-- Minetest 0.4 mod: vessels
-- See README.txt for licensing and other information.

minetest.register_node("lottdecor:glass_bottle", {
	description = "Glass Bottle (empty)",
	drawtype = "plantlike",
	tiles = {"vessels_glass_bottle.png"},
	inventory_image = "vessels_glass_bottle_inv.png",
	wield_image = "vessels_glass_bottle.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "lottdecor:glass_bottle 10",
	recipe = {
		{ "default:glass", "", "default:glass" },
		{ "default:glass", "", "default:glass" },
		{ "", "default:glass", "" }
	}
})

minetest.register_node("lottdecor:drinking_glass", {
	description = "Drinking Glass (empty)",
	drawtype = "plantlike",
	tiles = {"vessels_drinking_glass.png"},
	inventory_image = "vessels_drinking_glass_inv.png",
	wield_image = "vessels_drinking_glass.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "lottdecor:drinking_glass 14",
	recipe = {
		{ "default:glass", "", "default:glass" },
		{ "default:glass", "", "default:glass" },
		{ "default:glass", "default:glass", "default:glass" }
	}
})

minetest.register_node("lottdecor:steel_bottle", {
	description = "Heavy Steel Bottle (empty)",
	drawtype = "plantlike",
	tiles = {"vessels_steel_bottle.png"},
	inventory_image = "vessels_steel_bottle_inv.png",
	wield_image = "vessels_steel_bottle.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_craft( {
	output = "lottdecor:steel_bottle 5",
	recipe = {
		{ "default:steel_ingot", "", "default:steel_ingot" },
		{ "default:steel_ingot", "", "default:steel_ingot" },
		{ "", "default:steel_ingot", "" }
	}
})


-- Make sure we can recycle them

minetest.register_craftitem("lottdecor:glass_fragments", {
	description = "Pile of Glass Fragments",
	inventory_image = "vessels_glass_fragments.png",
})

minetest.register_craft( {
	type = "shapeless",
	output = "lottdecor:glass_fragments",
	recipe = {
		"lottdecor:glass_bottle",
		"lottdecor:glass_bottle",
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "lottdecor:glass_fragments",
	recipe = {
		"lottdecor:drinking_glass",
		"lottdecor:drinking_glass",
	},
})

minetest.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "lottdecor:glass_fragments",
})

minetest.register_craft( {
	type = "cooking",
	output = "default:steel_ingot",
	recipe = "lottdecor:steel_bottle",
})

