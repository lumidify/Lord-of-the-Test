--------------------------------------------------------------------------------
-- fabrics.lua: colored fabrics as ingredient for clothes
--------------------------------------------------------------------------------
-- HRtV 2014
-- version: 1.0
-- basics
--------------------------------------------------------------------------------
-- lottoutfit:flaxthread   - made of default:dry_shrub (4x)
-- lottoutfit:flax_<color> - made of flaxthread (5x) and dye:<color> (4x)

local fabric_colors = {
	black  = "dye:black",
	blue   = "dye:blue",
	brown  = "dye:brown",
	green  = "dye:green",
	grey   = "dye:grey",
	pink   = "dye:pink",
	red    = "dye:red",
	white  = "dye:white",
	yellow = "dye:yellow"	
}

-- flaxthreads made of dry_shrub. 2:1
minetest.register_craftitem("lottoutfit:flaxthread", {
	description = "Flax Thread",
	inventory_image = "flaxthread.png",
})
minetest.register_craft({
	type = "shapeless",
	output = "lottoutfit:flaxthread 2",
	recipe = {"default:dry_shrub","default:dry_shrub","default:dry_shrub","default:dry_shrub"}
})

-- flax, a fabric made of flaxthreads
for color, dye in pairs(fabric_colors) do
	minetest.register_craftitem("lottoutfit:flax_"..color, {
		description = color:gsub("^%l", string.upper).." Flax",
		inventory_image = "flax_"..color..".png"
	})
	
	if color == "brown" then
		-- default to brown
		minetest.register_craft({
			output = "lottoutfit:flax_"..color.." 3",
			recipe = {
				{"lottoutfit:flaxthread","lottoutfit:flaxthread","lottoutfit:flaxthread"},
				{"lottoutfit:flaxthread","lottoutfit:flaxthread","lottoutfit:flaxthread"},
				{"lottoutfit:flaxthread","lottoutfit:flaxthread","lottoutfit:flaxthread"},
			}
		})	
	else
		-- all other colors require little dye
		minetest.register_craft({
			output = "lottoutfit:flax_"..color.." 3",
			recipe = {
				{"lottoutfit:flaxthread",dye,"lottoutfit:flaxthread"},
				{dye,"lottoutfit:flaxthread",dye},
				{"lottoutfit:flaxthread",dye,"lottoutfit:flaxthread"},
			}
		})
	end
end


-- feltthreads
minetest.register_craftitem("lottoutfit:feltthread", {
	description = "Felt Thread",
	inventory_image = "feltthread.png",
})
minetest.register_craft({
	type = "shapeless",
	output = "lottoutfit:feltthread 2",
	recipe = {"group:leaves","group:leaves","group:leaves","group:leaves"}
})


-- felt, a fabric made of feltthreads
for color, dye in pairs(fabric_colors) do
	minetest.register_craftitem("lottoutfit:felt_"..color, {
		description = color:gsub("^%l", string.upper).." Felt",
		inventory_image = "felt_"..color..".png"
	})
	
	if color == "green" then
		-- green is default color, all felt (no dye)
		minetest.register_craft({
			output = "lottoutfit:felt_"..color.." 3",
			recipe = {
				{"lottoutfit:feltthread","lottoutfit:feltthread","lottoutfit:feltthread"},
				{"lottoutfit:feltthread","lottoutfit:feltthread","lottoutfit:feltthread"},
				{"lottoutfit:feltthread","lottoutfit:feltthread","lottoutfit:feltthread"},
			}
		})	
	else
		-- all other colors require little dye
		minetest.register_craft({
			output = "lottoutfit:felt_"..color.." 3",
			recipe = {
				{"lottoutfit:feltthread",dye,"lottoutfit:feltthread"},
				{dye,"lottoutfit:feltthread",dye},
				{"lottoutfit:feltthread",dye,"lottoutfit:feltthread"},
			}
		})
	end
end
