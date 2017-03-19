-- basic hobbit outfit.
-- made from varios flax (multi-color).
-- hasn't got headwear.

local fabric_colors = {
	blue   = "lottoutfit:flax_blue",
	brown  = "lottoutfit:flax_brown",
	green  = "lottoutfit:flax_green",
	grey   = "lottoutfit:flax_grey",
	pink   = "lottoutfit:flax_pink",
	red    = "lottoutfit:flax_red",
	white  = "lottoutfit:flax_white",
	yellow = "lottoutfit:flax_yellow"
}

local level=2

--per color crafting :)
for color, fabric in pairs(fabric_colors) do

	-- shirt (torso)
	minetest.register_tool("lottoutfit:shirt_hobbit_"..color, {
		description = color:gsub("^%l", string.upper).." Hobbit Shirt",
		inventory_image = "inv_shirt_hobbit_"..color..".png",
		groups = {armor_torso=0, armor_heal=0, clothes=1, clothes_torso=1},
		wear = 0
	})

	minetest.register_craft({
		output = "lottoutfit:shirt_hobbit_"..color,
		recipe = {
			{"lottoutfit:flax_white", "", "lottoutfit:flax_white"},
			{fabric, "lottoutfit:flax_white", fabric},
			{fabric, fabric, fabric}
		}
	})

	-- shorts(legs)
	minetest.register_tool("lottoutfit:shorts_hobbit_"..color, {
		description = color:gsub("^%l", string.upper).." Hobbit Shorts",
		inventory_image = "inv_shorts_hobbit_"..color..".png",
		groups = {armor_legs=0, armor_heal=0, clothes=1, clothes_legs=1},
		wear = 0
	})

	minetest.register_craft({
		output = "lottoutfit:shorts_hobbit_"..color,
		recipe = {
			{fabric, fabric, fabric},
			{fabric, "", fabric},
			{"lottoutfit:flax_white","" , "lottoutfit:flax_white"}
		}
	})

	-- shoes(feet)
	minetest.register_tool("lottoutfit:shoes_hobbit_"..color, {
		description = color:gsub("^%l", string.upper).." Hobbit Shoes",
		inventory_image = "inv_shoes_hobbit_"..color..".png",
		groups = {armor_feet=0, armor_heal=0, clothes=1, clothes_feet=1},
		wear = 0
	})

	minetest.register_craft({
		output = "lottoutfit:shoes_hobbit_"..color,
		recipe = {
			{fabric, "", fabric},
			{"lottoutfit:flax_black","" , "lottoutfit:flax_black"}
		}
	})

	-- cloak
	minetest.register_tool("lottoutfit:cloak_hobbit_"..color, {
		description = color:gsub("^%l", string.upper).." Hobbit Cloak",
		inventory_image = "inv_cloak_hobbit_"..color..".png",
		groups = {armor_heal=0, clothes=1, no_preview = 1, clothes_cloak=1},
		wear = 0
	})

	minetest.register_craft({
		output = "lottoutfit:cloak_hobbit_"..color,
		recipe = {
			{fabric, fabric},
			{fabric, fabric},
			{fabric, fabric}
		}
	})

end
