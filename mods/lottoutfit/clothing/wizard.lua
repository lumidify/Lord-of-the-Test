-- Clothes made for wizards


-- gandalf the grey:
-- big black dwarf boots
minetest.register_tool("lottoutfit:boots_dwarf", {
	description = "Dwarven Boots",
	inventory_image = "inv_boots_dwarven.png",
	groups = {armor_feet=0, armor_heal=0, clothes=1, clothes_feet=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:boots_dwarf",
	recipe = {
		{"lottoutfit:felt_black", "", "lottoutfit:felt_black"},
		{"default:steel_ingot", "", "default:steel_ingot"}
	}
})

-- cloak
minetest.register_tool("lottoutfit:cloak_wizard_grey", {
	description = "Grey Wizard Cloak",
	inventory_image = "inv_cloak_wizard_grey.png",
	groups = {armor_heal=0, clothes=1, no_preview=1, clothes_cloak=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:cloak_wizard_grey",
	recipe = {
		{"lottoutfit:felt_grey", "lottoutfit:felt_grey", "lottoutfit:felt_grey"},
		{"lottoutfit:felt_grey", "lottoutfit:felt_grey", "lottoutfit:felt_grey"}
	}
})

-- hood
minetest.register_tool("lottoutfit:hood_wizard_blue", {
	description = "Blue Wizard Hood",
	inventory_image = "inv_hood_wizard_blue.png",
	groups = {armor_heal=0, clothes=1, no_preview=1, clothes_head=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:hood_wizard_blue",
	recipe = {
		{"lottoutfit:felt_blue", "lottoutfit:felt_blue", "lottoutfit:felt_blue"},
		{"lottoutfit:felt_blue", "", "lottoutfit:felt_blue"}
	}
})

-- robe
minetest.register_tool("lottoutfit:robe_wizard_grey", {
	description = "Grey Wizard Robe",
	inventory_image = "inv_robe_wizard_grey.png",
	groups = {armor_heal=0, clothes=1, no_preview=1, clothes_torso=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:robe_wizard_grey",
	recipe = {
		{"lottoutfit:felt_grey", "", "lottoutfit:felt_grey"},
		{"lottoutfit:felt_grey", "lottoutfit:felt_grey", "lottoutfit:felt_grey"},
		{"lottoutfit:felt_grey", "lottoutfit:felt_grey", "lottoutfit:felt_grey"}
	}
})








-- gandalf the white
-- hood
minetest.register_tool("lottoutfit:hood_wizard_white", {
	description = "White Wizard Hood",
	inventory_image = "inv_hood_wizard_white.png",
	groups = {armor_heal=0, clothes=1, no_preview=1, clothes_head=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:hood_wizard_white",
	recipe = {
		{"lottoutfit:felt_white", "lottoutfit:felt_white", "lottoutfit:felt_white"},
		{"lottoutfit:felt_white", "", "lottoutfit:felt_white"}
	}
})

-- robe
minetest.register_tool("lottoutfit:robe_wizard_white", {
	description = "White Wizard Robe",
	inventory_image = "inv_robe_wizard_white.png",
	groups = {armor_heal=0, clothes=1, no_preview=1, clothes_torso=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:robe_wizard_white",
	recipe = {
		{"lottoutfit:felt_white", "", "lottoutfit:felt_white"},
		{"lottoutfit:felt_white", "lottoutfit:felt_white", "lottoutfit:felt_white"},
		{"lottoutfit:felt_white", "lottoutfit:felt_white", "lottoutfit:felt_white"}
	}
})

-- trousers
minetest.register_tool("lottoutfit:trousers_wizard_white", {
	description = "White Wizard Trousers",
	inventory_image = "inv_trousers_wizard_white.png",
	groups = {armor_heal=0, clothes=1, no_preview=1, clothes_legs=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:trousers_wizard_white",
	recipe = {
		{"lottoutfit:felt_white", "lottoutfit:felt_white", "lottoutfit:felt_white"},
		{"lottoutfit:felt_white", "", "lottoutfit:felt_white"},
		{"lottoutfit:felt_white", "", "lottoutfit:felt_white"}
	}
})

-- cloak
minetest.register_tool("lottoutfit:cloak_wizard_white", {
	description = "White Wizard Cloak",
	inventory_image = "inv_cloak_wizard_white.png",
	groups = {armor_heal=0, clothes=1, no_preview=1, clothes_cloak=1},
	wear = 0
})

minetest.register_craft({
	output = "lottoutfit:cloak_wizard_white",
	recipe = {
		{"lottoutfit:felt_white", "lottoutfit:felt_white"},
		{"lottoutfit:felt_white", "lottoutfit:felt_white"},
		{"lottoutfit:felt_white", "lottoutfit:felt_white"}
	}
})
