minetest.register_node("lottflora:brambles_of_mordor", {
	description = "Brambles Of Mordor",
	drawtype = "plantlike",
	tiles = { "shrub_brambles_of_mordor.png" },
	inventory_image = "shrub_brambles_of_mordor.png",
	wield_image = "shrub_brambles_of_mordor.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 42,
	walkable = false,
	waving = 1,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_grey=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, -0.3, 0.5 },
	},
})

minetest.register_node("lottflora:pilinehtar", {
	description = "Pilinehtar",
	drawtype = "plantlike",
	tiles = { "shrub_pilinehtar.png" },
	inventory_image = "shrub_pilinehtar.png",
	wield_image = "shrub_pilinehtar.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 2,
	walkable = false,
	buildable_to = true,
	waving = 1,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_green=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.3, -0.5, -0.3, 0.3, 0.27, 0.3 },
	},
})

--Lorien grass

minetest.register_node("lottflora:lorien_grass_1", {
	description = "Lorien Grass",
	drawtype = "plantlike",
	tiles = {"grass_lorien_1.png"},
	-- use a bigger inventory image
	inventory_image = "grass_lorien_3.png",
	wield_image = "grass_lorien_3.png",
	paramtype = "light",
	paramtype2 = "meshoptions",
	walkable = false,
	waving = 1,
	is_ground_content = true,
	buildable_to = true,
	groups = {snappy=3,flammable=3,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("lottflora:lorien_grass_"..math.random(1,4))
		local ret = minetest.item_place(stack, placer, pointed_thing, 40)
		return ItemStack("lottflora:lorien_grass_1 "..itemstack:get_count()-(1-ret:get_count()))
	end,
})

for i = 2, 4 do
	minetest.register_node("lottflora:lorien_grass_" .. i, {
		description = "Lorien Grass",
		drawtype = "plantlike",
		tiles = {"grass_lorien_" .. i .. ".png"},
		inventory_image = "grass_lorien_" .. i .. ".png",
		wield_image = "grass_lorien_" .. i .. ".png",
		paramtype = "light",
		paramtype2 = "meshoptions",
		walkable = false,
		buildable_to = true,
		waving = 1,
		is_ground_content = true,
		drop = "lottflora:lorien_grass_1",
		groups = {snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
end