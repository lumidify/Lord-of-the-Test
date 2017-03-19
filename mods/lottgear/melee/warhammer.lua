minetest.register_tool("lottgear:wood_warhammer", {
	description = "Training Warhammer",
	inventory_image = "warhammer_wood.png",
	range = 2,
	tool_capabilities = {
		full_punch_interval = 2,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=3.40, [2]=2.40, [3]=1.30}, uses=5, maxlevel=1},
		},
		damage_groups = {fleshy=.75},
	},
})

minetest.register_tool("lottgear:stone_warhammer", {
	description = "Stone Warhammer",
	inventory_image = "warhammer_stone.png",
	range = 2,
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.85, [2]=1.85, [3]=1.10}, uses=5, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("lottgear:copper_warhammer", {
	description = "Copper Warhammer",
	inventory_image = "warhammer_copper.png",
	range = 2,
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=3, [2]=1.80, [3]=1.00}, uses=5, maxlevel=1},
		},
		damage_groups = {fleshy=4.5},
	},
})

minetest.register_tool("lottgear:tin_warhammer", {
	description = "Tin Warhammer",
	inventory_image = "warhammer_tin.png",
	range = 2,
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=3, [2]=1.80, [3]=1.00}, uses=5, maxlevel=1},
		},
		damage_groups = {fleshy=4.5},
	},
})

minetest.register_tool("lottgear:steel_warhammer", {
	description = "Steel Warhammer",
	inventory_image = "warhammer_steel.png",
	range = 2,
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.75, [2]=1.45, [3]=0.60}, uses=25, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("lottgear:bronze_warhammer", {
	description = "Bronze Warhammer",
	inventory_image = "warhammer_bronze.png",
	range = 2,
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.75, [2]=1.45, [3]=0.60}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=6.5},
	},
})

minetest.register_tool("lottgear:silver_warhammer", {
	description = "Silver Warhammer",
	inventory_image = "warhammer_silver.png",
	range = 2,
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.60, [2]=1.40, [3]=0.50}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=7.5},
	},
})

minetest.register_tool("lottgear:gold_warhammer", {
	description = "Gold Warhammer",
	inventory_image = "warhammer_gold.png",
	tool_capabilities = {
		full_punch_interval = 0.75,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.60, [2]=1.40, [3]=0.50}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=7.5},
	},
})

minetest.register_tool("lottgear:galvorn_warhammer", {
	description = "Galvorn Warhammer",
	inventory_image = "warhammer_galvorn.png",
	range = 2,
     groups = {forbidden=1},
	tool_capabilities = {
		full_punch_interval = 0.50,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.50, [2]=1.30, [3]=0.45}, uses=35, maxlevel=2},
		},
		damage_groups = {fleshy=8},
	},
})

minetest.register_tool("lottgear:mithril_warhammer", {
	description = "Mithril Warhammer",
	inventory_image = "warhammer_mithril.png",
	range = 2,
	tool_capabilities = {
		full_punch_interval = 0.25,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.60, [2]=1.40, [3]=0.50}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	},
})

-- Crafts
minetest.register_craft({
	output = 'lottgear:wood_warhammer',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:stick', 'group:wood'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:stone_warhammer',
	recipe = {
		{'default:cobble', 'default:cobble', 'default:cobble'},
		{'default:cobble', 'group:stick', 'default:cobble'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:copper_warhammer',
	recipe = {
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
		{'default:copper_ingot', 'group:stick', 'default:copper_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:tin_warhammer',
	recipe = {
		{'lottcosmos:tin_ingot', 'lottcosmos:tin_ingot', 'lottcosmos:tin_ingot'},
		{'lottcosmos:tin_ingot', 'group:stick', 'lottcosmos:tin_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:steel_warhammer',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'group:stick', 'default:steel_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:bronze_warhammer',
	recipe = {
		{'default:bronze_ingot', 'default:bronze_ingot', 'default:bronze_ingot'},
		{'default:bronze_ingot', 'group:stick', 'default:bronze_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:silver_warhammer',
	recipe = {
		{'lottcosmos:silver_ingot', 'lottcosmos:silver_ingot', 'lottcosmos:silver_ingot'},
		{'lottcosmos:silver_ingot', 'group:stick', 'lottcosmos:silver_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:gold_warhammer',
	recipe = {
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
		{'default:gold_ingot', 'group:stick', 'default:gold_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:galvorn_warhammer',
	recipe = {
		{'lottcosmos:galvorn_ingot', 'lottcosmos:galvorn_ingot', 'lottcosmos:galvorn_ingot'},
		{'lottcosmos:galvorn_ingot', 'group:stick', 'lottcosmos:galvorn_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:mithril_warhammer',
	recipe = {
		{'lottcosmos:mithril_ingot', 'lottcosmos:mithril_ingot', 'lottcosmos:mithril_ingot'},
		{'lottcosmos:mithril_ingot', 'group:stick', 'lottcosmos:mithril_ingot'},
		{'', 'group:stick', ''},
	}
})