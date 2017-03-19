minetest.register_tool("lottgear:wood_battleaxe", {
	description = "Training Battleaxe",
	inventory_image = "battleaxe_wood.png",
	tool_capabilities = {
		full_punch_interval = 2,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.75, [2]=2.75, [3]=2.05}, uses=5, maxlevel=1},
			snappy={times={[1]=2.75, [2]=1.75, [3]=0.75}, uses=5, maxlevel=1},
		},
		damage_groups = {fleshy=.50},
	},
})

minetest.register_tool("lottgear:stone_battleaxe", {
	description = "Stone Battleaxe",
	inventory_image = "battleaxe_stone.png",
	tool_capabilities = {
		full_punch_interval = 1.50,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.35, [2]=2.10, [3]=1.85}, uses=5, maxlevel=1},
			snappy={times={[1]=2.75, [2]=1.75, [3]=0.75}, uses=5, maxlevel=1},
		},
		damage_groups = {fleshy=1.50},
	},
})

minetest.register_tool("lottgear:copper_battleaxe", {
	description = "Copper Battleaxe",
	inventory_image = "battleaxe_copper.png",
	tool_capabilities = {
		full_punch_interval = 1.25,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.25, [2]=2.00, [3]=1.75}, uses=5, maxlevel=1},
			snappy={times={[1]=2.75, [2]=1.45, [3]=0.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("lottgear:tin_battleaxe", {
	description = "Tin Battleaxe",
	inventory_image = "battleaxe_tin.png",
	tool_capabilities = {
		full_punch_interval = 1.25,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.25, [2]=2.00, [3]=1.75}, uses=5, maxlevel=1},
			snappy={times={[1]=2.75, [2]=1.45, [3]=0.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("lottgear:steel_battleaxe", {
	description = "Steel Battleaxe",
	inventory_image = "battleaxe_steel.png",
	tool_capabilities = {
		full_punch_interval = 1.05,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3, [2]=1.90, [3]=1.50}, uses=15, maxlevel=2},
			snappy={times={[1]=2.75, [2]=1.45, [3]=0.60}, uses=25, maxlevel=2},
		},
		damage_groups = {fleshy=4.5},
	},
})

minetest.register_tool("lottgear:bronze_battleaxe", {
	description = "Bronze Battleaxe",
	inventory_image = "battleaxe_bronze.png",
	tool_capabilities = {
		full_punch_interval = 0.90,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.80, [2]=1.70, [3]=1.30}, uses=20, maxlevel=2},
			snappy={times={[1]=2.55, [2]=1.25, [3]=0.50}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=5},
	},
})

minetest.register_tool("lottgear:silver_battleaxe", {
	description = "Silver Battleaxe",
	inventory_image = "battleaxe_silver.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.80, [2]=1.70, [3]=1.30}, uses=15, maxlevel=2},
			snappy={times={[1]=2.60, [2]=1.30, [3]=0.50}, uses=25, maxlevel=2},
		},
		damage_groups = {fleshy=5.5},
	},
})

minetest.register_tool("lottgear:gold_battleaxe", {
	description = "Gold Battleaxe",
	inventory_image = "battleaxe_gold.png",
	tool_capabilities = {
		full_punch_interval = 0.75,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.80, [2]=1.70, [3]=1.30}, uses=20, maxlevel=2},
			snappy={times={[1]=2.60, [2]=1.30, [3]=0.50}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=5.5},
	},
})

minetest.register_tool("lottgear:galvorn_battleaxe", {
	description = "Galvorn Battleaxe",
	inventory_image = "battleaxe_galvorn.png",
     groups = {forbidden=1},
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.50, [3]=.90}, uses=25, maxlevel=2},
			snappy={times={[1]=2.50, [2]=1.50, [3]=0.85}, uses=35, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("lottgear:mithril_battleaxe", {
	description = "Mithril Battleaxe",
	inventory_image = "battleaxe_mithril.png",
	tool_capabilities = {
		full_punch_interval = .25,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2, [2]=1, [3]=.50}, uses=35, maxlevel=3},
			snappy={times={[1]=1, [2]=1.10, [3]=0.50}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
})

-- Crafts
minetest.register_craft({
	output = 'lottgear:wood_battleaxe',
	recipe = {
		{'group:wood', 'group:stick', 'group:wood'},
		{'group:wood', 'group:stick', 'group:wood'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:stone_battleaxe',
	recipe = {
		{'default:cobble', 'group:stick', 'default:cobble'},
		{'default:cobble', 'group:stick', 'default:cobble'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:copper_battleaxe',
	recipe = {
		{'default:copper_ingot', 'group:stick', 'default:copper_ingot'},
		{'default:copper_ingot', 'group:stick', 'default:copper_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:tin_battleaxe',
	recipe = {
		{'lottcosmos:tin_ingot', 'group:stick', 'lottcosmos:tin_ingot'},
		{'lottcosmos:tin_ingot', 'group:stick', 'lottcosmos:tin_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:steel_battleaxe',
	recipe = {
		{'default:steel_ingot', 'group:stick', 'default:steel_ingot'},
		{'default:steel_ingot', 'group:stick', 'default:steel_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:bronze_battleaxe',
	recipe = {
		{'default:bronze_ingot', 'group:stick', 'default:bronze_ingot'},
		{'default:bronze_ingot', 'group:stick', 'default:bronze_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:silver_battleaxe',
	recipe = {
		{'lottcosmos:silver_ingot', 'group:stick', 'lottcosmos:silver_ingot'},
		{'lottcosmos:silver_ingot', 'group:stick', 'lottcosmos:silver_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:gold_battleaxe',
	recipe = {
		{'default:gold_ingot', 'group:stick', 'default:gold_ingot'},
		{'default:gold_ingot', 'group:stick', 'default:gold_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:galvorn_battleaxe',
	recipe = {
		{'lottcosmos:galvorn_ingot', 'group:stick', 'lottcosmos:galvorn_ingot'},
		{'lottcosmos:galvorn_ingot', 'group:stick', 'lottcosmos:galvorn_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:mithril_battleaxe',
	recipe = {
		{'lottcosmos:mithril_ingot', 'group:stick', 'lottcosmos:mithril_ingot'},
		{'lottcosmos:mithril_ingot', 'group:stick', 'lottcosmos:mithril_ingot'},
		{'', 'group:stick', ''},
	}
})