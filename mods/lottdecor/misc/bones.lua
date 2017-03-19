local function growgen(pointed_thing)
	pos = pointed_thing.under
	n = minetest.get_node(pos)
	if n.name == "" then return end
	if n.name == "lottfarming:turnips_1" then
		minetest.set_node(pos, {name="lottfarming:turnips_2"})
	elseif n.name == "lottfarming:turnips_2" then
		minetest.set_node(pos, {name="lottfarming:turnips_3"})
	elseif n.name == "lottfarming:turnips_3" then
		minetest.set_node(pos, {name="lottfarming:turnips_4"})
	elseif n.name == "lottfarming:athelas_1" then
		minetest.set_node(pos, {name="lottfarming:athelas_2"})
	elseif n.name == "lottfarming:athelas_2" then
		minetest.set_node(pos, {name="lottfarming:athelas_3"})
	elseif n.name == "lottfarming:barley_1" then
		minetest.set_node(pos, {name="lottfarming:barley_2"})
	elseif n.name == "lottfarming:barley_2" then
		minetest.set_node(pos, {name="lottfarming:barley_3"})
	elseif n.name == "lottfarming:berries_1" then
		minetest.set_node(pos, {name="lottfarming:berries_2"})
	elseif n.name == "lottfarming:berries_2" then
		minetest.set_node(pos, {name="lottfarming:berries_3"})
	elseif n.name == "lottfarming:berries_3" then
		minetest.set_node(pos, {name="lottfarming:berries_4"})
	elseif n.name == "lottfarming:blue_mushroom_1" then
		minetest.set_node(pos, {name="lottfarming:blue_mushroom_2"})
	elseif n.name == "lottfarming:blue_mushroom_2" then
		minetest.set_node(pos, {name="lottfarming:blue_mushroom_3"})
	elseif n.name == "lottfarming:blue_mushroom_3" then
		minetest.set_node(pos, {name="lottfarming:blue_mushroom_4"})
	elseif n.name == "lottfarming:brown_mushroom_1" then
		minetest.set_node(pos, {name="lottfarming:brown_mushroom_2"})
	elseif n.name == "lottfarming:brown_mushroom_2" then
		minetest.set_node(pos, {name="lottfarming:brown_mushroom_3"})
	elseif n.name == "lottfarming:brown_mushroom_3" then
		minetest.set_node(pos, {name="lottfarming:brown_mushroom_4"})
	elseif n.name == "lottfarming:cabbage_1" then
		minetest.set_node(pos, {name="lottfarming:cabbage_2"})
	elseif n.name == "lottfarming:cabbage_2" then
		minetest.set_node(pos, {name="lottfarming:cabbage_3"})
	elseif n.name == "lottfarming:green_mushroom_1" then
		minetest.set_node(pos, {name="lottfarming:green_mushroom_2"})
	elseif n.name == "lottfarming:green_mushroom_2" then
		minetest.set_node(pos, {name="lottfarming:green_mushroom_3"})
	elseif n.name == "lottfarming:green_mushroom_3" then
		minetest.set_node(pos, {name="lottfarming:green_mushroom_4"})
	elseif n.name == "lottfarming:melon_1" then
		minetest.set_node(pos, {name="lottfarming:melon_2"})
	elseif n.name == "lottfarming:melon_2" then
		minetest.set_node(pos, {name="lottfarming:melon_3"})
	elseif n.name == "lottfarming:pipeweed_1" then
		minetest.set_node(pos, {name="lottfarming:pipeweed_2"})
	elseif n.name == "lottfarming:pipeweed_2" then
		minetest.set_node(pos, {name="lottfarming:pipeweed_3"})
	elseif n.name == "lottfarming:pipeweed_3" then
		minetest.set_node(pos, {name="lottfarming:pipeweed_4"})
	elseif n.name == "lottfarming:potato_1" then
		minetest.set_node(pos, {name="lottfarming:potato_2"})
	elseif n.name == "lottfarming:potato_2" then
		minetest.set_node(pos, {name="lottfarming:potato_3"})
	elseif n.name == "lottfarming:red_mushroom_1" then
		minetest.set_node(pos, {name="lottfarming:red_mushroom_2"})
	elseif n.name == "lottfarming:red_mushroom_2" then
		minetest.set_node(pos, {name="lottfarming:red_mushroom_3"})
	elseif n.name == "lottfarming:red_mushroom_3" then
		minetest.set_node(pos, {name="lottfarming:red_mushroom_4"})
	elseif n.name == "lottfarming:white_mushroom_1" then
		minetest.set_node(pos, {name="lottfarming:white_mushroom_2"})
	elseif n.name == "lottfarming:white_mushroom_2" then
		minetest.set_node(pos, {name="lottfarming:white_mushroom_3"})
	elseif n.name == "lottfarming:white_mushroom_3" then
		minetest.set_node(pos, {name="lottfarming:white_mushroom_4"})
	elseif n.name == "lottfarming:tomatoes_1" then
		minetest.set_node(pos, {name="lottfarming:tomatoes_2"})
	elseif n.name == "lottfarming:tomatoes_2" then
		minetest.set_node(pos, {name="lottfarming:tomatoes_3"})
	elseif n.name == "lottfarming:tomatoes_3" then
		minetest.set_node(pos, {name="lottfarming:tomatoes_4"})
	elseif n.name == "lottfarming:corn_1" then
		minetest.set_node(pos, {name="lottfarming:corn_2"})
	elseif n.name == "lottfarming:corn_2" then
		minetest.set_node(pos, {name="lottfarming:corn_21"})
	elseif n.name == "lottfarming:corn_21" then
		minetest.set_node(pos, {name="lottfarming:corn_32"})
	elseif n.name == "farming:wheat_1" then
		minetest.set_node(pos, {name="farming:wheat_2"})
	elseif n.name == "farming:wheat_2" then
		minetest.set_node(pos, {name="farming:wheat_3"})
	elseif n.name == "farming:wheat_3" then
		minetest.set_node(pos, {name="farming:wheat_4"})
	elseif n.name == "farming:wheat_4" then
		minetest.set_node(pos, {name="farming:wheat_5"})
	elseif n.name == "farming:wheat_5" then
		minetest.set_node(pos, {name="farming:wheat_6"})
	elseif n.name == "farming:wheat_6" then
		minetest.set_node(pos, {name="farming:wheat_7"})
	elseif n.name == "farming:wheat_7" then
		minetest.set_node(pos, {name="farming:wheat_8"})
	elseif n.name == "farming:cotton_1" then
		minetest.set_node(pos, {name="farming:cotton_2"})
	elseif n.name == "farming:cotton_2" then
		minetest.set_node(pos, {name="farming:cotton_3"})
	elseif n.name == "farming:cotton_3" then
		minetest.set_node(pos, {name="farming:cotton_4"})
	elseif n.name == "farming:cotton_4" then
		minetest.set_node(pos, {name="farming:cotton_5"})
	elseif n.name == "farming:cotton_5" then
		minetest.set_node(pos, {name="farming:cotton_6"})
	elseif n.name == "farming:cotton_6" then
		minetest.set_node(pos, {name="farming:cotton_7"})
	elseif n.name == "farming:cotton_7" then
		minetest.set_node(pos, {name="farming:cotton_8"})
	else return
	end
end

minetest.register_craftitem("lottdecor:bonedust", {
	description = "Bone Dust",
	inventory_image = "bones_bonedust.png",
	liquids_pointable = false,
	stack_max = 99,
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "node" then
			growgen(pointed_thing)
			itemstack:take_item()
			return itemstack
		end
	end,
})

minetest.register_craftitem("lottdecor:bone", {
	description = "Bone",
	inventory_image = "bones_bone.png",
})

minetest.register_node("lottdecor:skeleton_top", {
	description = "Skeleton Head",
	drawtype = "nodebox",
	tiles = {
		"bones_skeleton_top.png",
		"bones_skeleton_bottom.png",
		"bones_skeleton_side.png",
		"bones_skeleton_side.png",
		"bones_skeleton_rear.png",
		"bones_skeleton_front.png"
	},
	pointable = false,
	paramtype2 = "facedir",
	paramtype = "light",
	groups = {},
	drop = '',
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125,0.3125,-0.3125,0.3125,0.5,0.3125},
			{ -0.5,0.25,-0.5,0.5,0.415385,0.5},
			{-0.5,-0.1875,-0.5,0.5,0.375,0.5},
			{-0.375,-0.5,-0.3125,0.375,0.125,0.3125},
		},
	},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})

minetest.register_node("lottdecor:skeleton", {
	description = "Skeleton",
	drawtype = "nodebox",
	tiles = {"bones_skeleton_top.png"},
	inventory_image = "bones_skeleton.png",
	wield_image = "bones_skeleton.png",
	paramtype2 = "facedir",
	paramtype = "light",
	groups = {dig_immediate=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625,-0.0625,-0.0625,0.125,0.5,0.0625},
			{-0.25,-0.3125,-0.25,0.3125,-0.0625,0.25},
			{-0.25,-0.5,-0.0625,-0.125,-0.0625,0.125},
			{0.3125,-0.5,-0.0625,0.1875,-0.0625,0.125},
			{-0.3125,0,-0.375,0.375,0.125,0.375},
			{-0.3125,0.375,-0.375,0.375,0.5,0.375},
			{-0.3125,0.1875,-0.375,0.375,0.3125,0.375},
			{0.375,-0.0625,-0.0625,0.5,0.5,0.1875},
			{-0.3125,-0.0625,-0.0625,-0.4375,0.5,0.1875},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 }
	},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
	on_place = function(itemstack, placer, pointed_thing)
        local above = pointed_thing.above
        if minetest.get_node({x = above.x, y = above.y + 1, z = above.z}).name ~= "air" then
            return itemstack
        end
        local fdir = 0
        local placer_pos = placer:getpos()
        if placer_pos then
            dir = {
                x = above.x - placer_pos.x,
                y = above.y - placer_pos.y,
                z = above.z - placer_pos.z
            }
            fdir = minetest.dir_to_facedir(dir)
        end
		minetest.add_node(above, {name = "lottdecor:skeleton", param2 = fdir})
		minetest.add_node({x = above.x, y = above.y + 1, z = above.z}, {name = "lottdecor:skeleton_top", param2 = fdir})
		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
    end,
    on_destruct = function(pos)
		local p = {x=pos.x, y=pos.y+1, z=pos.z}
		minetest.dig_node(p)
    end
})