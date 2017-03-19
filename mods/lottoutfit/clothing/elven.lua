minetest.register_tool("lottoutfit:hood_elven", {
	description = "Elven Hood",
	inventory_image = "inv_hood_elven.png",
	groups = {armor_feet=0, armor_heal=0, clothes=1, clothes_head=1},
	wear = 0
})

minetest.register_tool("lottoutfit:shirt_elven", {
	description = "Elven Shirt",
	inventory_image = "inv_shirt_elven.png",
	groups = {armor_feet=0, armor_heal=0, clothes=1, clothes_torso=1},
	wear = 0
})

minetest.register_tool("lottoutfit:trousers_elven", {
	description = "Elven Trousers",
	inventory_image = "inv_trousers_elven.png",
	groups = {armor_feet=0, armor_heal=0, clothes=1, clothes_legs=1},
	wear = 0
})

minetest.register_tool("lottoutfit:shoes_elven", {
	description = "Elven Shoes",
	inventory_image = "inv_shoes_elven.png",
	groups = {armor_feet=0, armor_heal=0, clothes=1, clothes_feet=1},
	wear = 0
})

minetest.register_tool("lottoutfit:cloak_elven", {
	description = "Elven Cloak",
	inventory_image = "inv_cloak_elven.png",
	groups = {armor_feet=0, armor_heal=0, clothes=1, clothes_cloak=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:hood_elven",
	recipe = {
		{"lottoutfit:flax_grey", "lottoutfit:flax_grey", "lottoutfit:flax_grey"},
		{"lottoutfit:flax_grey", "" , "lottoutfit:flax_grey"},
	}
})

minetest.register_craft({
	output = "lottoutfit:shirt_elven",
	recipe = {
		{"lottoutfit:flax_grey", "", "lottoutfit:flax_grey"},
		{"lottoutfit:flax_grey", "lottoutfit:flax_grey", "lottoutfit:flax_grey"},
		{"lottoutfit:flax_grey", "lottoutfit:flax_grey", "lottoutfit:flax_grey"}
	}
})

minetest.register_craft({
	output = "lottoutfit:trousers_elven",
	recipe = {
		{"lottoutfit:flax_grey", "lottoutfit:flax_grey", "lottoutfit:flax_grey"},
		{"lottoutfit:flax_grey", "" , "lottoutfit:flax_grey"},
		{"lottoutfit:flax_grey", "" , "lottoutfit:flax_grey"}
	}
})

minetest.register_craft({
	output = "lottoutfit:shoes_elven",
	recipe = {
		{"lottoutfit:flax_grey", "" , "lottoutfit:flax_grey"},
		{"lottoutfit:felt_black", "" , "lottoutfit:felt_black"}
	}
})

minetest.register_craft({
	output = "lottoutfit:cloak_elven",
	recipe = {
		{"lottoutfit:flax_grey", "lottoutfit:flax_grey"},
		{"lottoutfit:flax_grey", "lottoutfit:flax_grey"},
		{"lottoutfit:flax_grey", "lottoutfit:flax_grey"}
	}
})
