-- Blue gem
minetest.register_node("lottcosmos:blue_gem_ore", {
	description = "Blue Gem Ore",
	tiles = {"default_stone.png^gem_blue_ore.png"},
	is_ground_content = true,
	groups = {gems=1, creative=1},
	drop = {
		items = {
			{
				items = {'lottcosmos:stony_blue_gem'},
				rarity = 5,
			},
			{
				items = {''},
			}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("lottcosmos:stony_blue_gem", {
	description = "Stone Encrusted Blue Gem",
	inventory_image = "gem_blue_stony.png",
})

-- White gem
minetest.register_node("lottcosmos:white_gem_ore", {
	description = "White Gem Ore",
	tiles = {"default_stone.png^gem_white_ore.png"},
	is_ground_content = true,
	groups = {gems=1, creative=1},
	drop = {
		items = {
			{
				items = {'lottcosmos:stony_white_gem'},
				rarity = 5,
			},
			{
				items = {''},
			}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("lottcosmos:stony_white_gem", {
	description = "Stone Encrusted White Gem",
	inventory_image = "gem_white_stony.png",
})

-- Purple gem
minetest.register_node("lottcosmos:purple_gem_ore", {
	description = "Purple Gem Ore",
	tiles = {"default_stone.png^gem_purple_ore.png"},
	is_ground_content = true,
	groups = {gems=1, creative=1},
	drop = {
		items = {
			{
				items = {'lottcosmos:stony_purple_gem'},
				rarity = 5,
			},
			{
				items = {''},
			}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("lottcosmos:stony_purple_gem", {
	description = "Stone Encrusted Purple Gem",
	inventory_image = "gem_purple_stony.png",
})

-- Red gem
minetest.register_node("lottcosmos:red_gem_ore", {
	description = "Red Gem Ore",
	tiles = {"default_stone.png^gem_red_ore.png"},
	is_ground_content = true,
	groups = {gems=1, creative=1},
	drop = {
		items = {
			{
				items = {'lottcosmos:stony_red_gem'},
				rarity = 5,
			},
			{
				items = {''},
			}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("lottcosmos:stony_red_gem", {
	description = "Stone Encrusted Red Gem",
	inventory_image = "gem_red_stony.png",
})