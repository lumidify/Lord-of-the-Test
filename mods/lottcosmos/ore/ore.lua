-- Ores
-- Rough Rock
minetest.register_node("lottcosmos:rough_rock", {
	description = "Rough Rock",
	tiles = {"default_stone.png^ore_rough_rock.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'lottcosmos:rough_rock_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("lottcosmos:rough_rock_lump", {
	description = "Rough Rock Lump",
	inventory_image = "ore_rough_rock_lump.png",
})

-- Silver
minetest.register_node("lottcosmos:silver_ore", {
	description = "Silver Ore",
	tiles = {"default_stone.png^ore_silver.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'lottcosmos:silver_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("lottcosmos:silver_lump", {
	description = "Silver Lump",
	inventory_image = "ore_silver_lump.png",
})

-- Tin
minetest.register_node("lottcosmos:tin_ore", {
	description = "Tin Ore",
	tiles = {"default_stone.png^ore_tin.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = "lottcosmos:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("lottcosmos:tin_lump", {
	description = "Tin Lump",
	inventory_image = "ore_tin_lump.png",
})

-- Limestone
minetest.register_node("lottcosmos:limestone", {
	description = "Limestone",
	tiles = {"ore_limestone.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=2},
	sounds = default.node_sound_stone_defaults(),
})

-- Lead
minetest.register_node("lottcosmos:lead_ore", {
	description = "Lead Ore",
	tiles = {"default_stone.png^ore_lead.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = "lottcosmos:lead_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("lottcosmos:lead_lump", {
	description = "Lead Lump",
	inventory_image = "ore_lead_lump.png",
})

-- Mithril
minetest.register_node("lottcosmos:mithril_ore", {
	description = "Mithril Ore",
	tiles = {"default_stone.png^ore_mithril.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = "lottcosmos:mithril_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("lottcosmos:mithril_lump", {
	description = "Mithril Lump",
	inventory_image = "ore_mithril_lump.png",
})

-- Sea Ores
-- Pearl
minetest.register_node("lottcosmos:mineral_pearl", {
	description = "Pearl Ore",
	tiles = {"default_sand.png^ore_mineral_pearl.png"},
	paramtype = "light",
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	drop = {
		items = {
			{
				items = {'lottcosmos:pearl'},
			},
			{
				items = {'default:sand'},
			}
		}
	},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_craftitem("lottcosmos:pearl", {
	description = "Pearl",
	inventory_image = "ore_pearl.png",
})

-- Salt
minetest.register_node("lottcosmos:mineral_salt", {
	description = "Salt Mineral",
	tiles = {"default_dirt.png^ore_mineral_salt.png"},
	paramtype = "light",
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	drop = {
		items = {
			{
				items = {'lottcosmos:salt'},
			},
			{
				items = {'default:dirt'},
			}
		}
	},
	sounds = default.node_sound_dirt_defaults,
})

minetest.register_craftitem("lottcosmos:salt", {
	description = "Salt",
	inventory_image = "ore_salt.png",
	on_use = minetest.item_eat(1),
})