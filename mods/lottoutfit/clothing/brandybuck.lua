-- basic outfit from the the brandybuck family.
-- made from blue flax and copper ingot.
-- hasn't got headwear.

local level=2

-- shirt (torso)
minetest.register_tool("lottoutfit:shirt_brandybuck", {
	description = "Brandybuck Shirt",
	inventory_image = "inv_shirt_brandybuck.png",
	groups = {armor_torso=0, armor_heal=0, clothes=1, clothes_torso=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:shirt_brandybuck",
	recipe = {
		{"lottoutfit:flax_blue", "", "lottoutfit:flax_blue"},
		{"lottoutfit:flax_yellow", "lottoutfit:flax_blue", "lottoutfit:flax_yellow"},
		{"lottoutfit:flax_yellow", "lottoutfit:flax_blue", "lottoutfit:flax_yellow"}
	}
})

-- trousers (legs)
minetest.register_tool("lottoutfit:trousers_brandybuck", {
	description = "Brandybuck Trousers",
	inventory_image = "inv_trousers_brandybuck.png",
	groups = {armor_legs=0, armor_heal=0, clothes=1, clothes_legs=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:trousers_brandybuck",
	recipe = {
		{"lottoutfit:flax_brown", "lottoutfit:flax_brown", "lottoutfit:flax_brown"},
		{"lottoutfit:flax_brown", "" , "lottoutfit:flax_brown"},
		{"lottoutfit:flax_brown", "" , "lottoutfit:flax_brown"}
	}
})

-- shoes (feet)
minetest.register_tool("lottoutfit:shoes_brandybuck", {
	description = "Brandybuck Shoes",
	inventory_image = "inv_shoes_brandybuck.png",
	groups = {armor_feet=0, armor_heal=0, clothes=1, clothes_feet=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:shoes_brandybuck",
	recipe = {
		{"lottoutfit:flax_blue", "", "lottoutfit:flax_blue"},
		{"default:copper_ingot", "", "default:copper_ingot"}
	}
})
