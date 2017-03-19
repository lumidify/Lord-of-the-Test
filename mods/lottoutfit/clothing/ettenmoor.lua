-- outfit from the ettenmoor region. wizard style (as possible).
-- made from grey and brown felt & gold ingot.
-- it's difficult to make because dye:brown, dye:grey and lottores:gold.
-- hasn't got boots.

local level=4

-- hood (head)
minetest.register_tool("lottoutfit:hood_ettenmoor", {
	description = "Ettenmoor Hood",
	inventory_image = "inv_hood_ettenmoor.png",
	groups = {armor_head=0, armor_heal=0, clothes=1, clothes_head=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:hood_ettenmoor",
	recipe = {
		{"lottoutfit:felt_grey", "lottoutfit:felt_grey", "lottoutfit:felt_grey"},
		{"lottoutfit:felt_grey", "", "lottoutfit:felt_grey"},
		{"", "",""}
	}
})

-- robe (torso (yeah limitations suck))
minetest.register_tool("lottoutfit:robe_ettenmoor", {
	description = "Ettenmoor Robe",
	inventory_image = "inv_robe_ettenmoor.png",
	groups = {armor_torso=0, armor_heal=0, clothes=1, clothes_torso=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:robe_ettenmoor",
	recipe = {
		{"lottoutfit:felt_grey", "", "lottoutfit:felt_grey"},
		{"lottoutfit:felt_grey", "lottoutfit:felt_grey", "lottoutfit:felt_grey"},
		{"lottoutfit:felt_brown", "default:gold_ingot", "lottoutfit:felt_brown"}
	}
})

-- trousers (legs)
minetest.register_tool("lottoutfit:trousers_ettenmoor", {
	description = "Ettenmoor Trousers",
	inventory_image = "inv_trousers_ettenmoor.png",
	groups = {armor_legs=0, armor_heal=0, clothes=1, clothes_legs=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:trousers_ettenmoor",
	recipe = {
		{"lottoutfit:felt_grey", "lottoutfit:felt_grey", "lottoutfit:felt_grey"},
		{"lottoutfit:felt_grey", "" , "lottoutfit:felt_grey"},
		{"lottoutfit:felt_grey", "" , "lottoutfit:felt_grey"}
	}
})
