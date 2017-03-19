-- the simplest outfit available.
-- made from green felt & wood (just cut down the nearest tree).

local level=1

-- cap (head)
minetest.register_tool("lottoutfit:cap_midgewater", {
	description = "Midgewater Cap",
	inventory_image = "inv_cap_midgewater.png",
	groups = {armor_head=0, armor_heal=0, clothes=1, clothes_head=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:cap_midgewater",
	recipe = {
		{"lottoutfit:felt_green", "lottoutfit:felt_green", "lottoutfit:felt_green"},
		{"lottoutfit:felt_green", "", "lottoutfit:felt_green"},
		{"", "",""}
	}
})

-- jacket (torso)
minetest.register_tool("lottoutfit:jacket_midgewater", {
	description = "Midgewater Jacket",
	inventory_image = "inv_jacket_midgewater.png",
	groups = {armor_torso=0, armor_heal=0, clothes=1, clothes_torso=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:jacket_midgewater",
	recipe = {
		{"lottoutfit:felt_green", "", "lottoutfit:felt_green"},
		{"lottoutfit:felt_green", "lottoutfit:felt_green", "lottoutfit:felt_green"},
		{"lottoutfit:felt_green", "lottoutfit:felt_green", "lottoutfit:felt_green"}
	}
})

-- pants (legs)
minetest.register_tool("lottoutfit:pants_midgewater", {
	description = "Midgewater Pants",
	inventory_image = "inv_pants_midgewater.png",
	groups = {armor_legs=0, armor_heal=0, clothes=1, clothes_legs=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:pants_midgewater",
	recipe = {
		{"lottoutfit:felt_green", "lottoutfit:felt_green", "lottoutfit:felt_green"},
		{"lottoutfit:felt_green", "" , "lottoutfit:felt_green"},
		{"lottoutfit:felt_green", "" , "lottoutfit:felt_green"}
	}
})

-- boots (feet)
minetest.register_tool("lottoutfit:boots_midgewater", {
	description = "Midgewater Boots",
	inventory_image = "inv_boots_midgewater.png",
	groups = {armor_feet=0, armor_heal=0, clothes=1, clothes_feet=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:boots_midgewater",
	recipe = {
		{"lottoutfit:flax_brown", "", "lottoutfit:flax_brown"},
		{"group:wood", "", "group:wood"}
	}
})
