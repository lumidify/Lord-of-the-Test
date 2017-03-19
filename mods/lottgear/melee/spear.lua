minetest.register_tool("lottgear:wood_spear", {
	description = "Training Spear",
	inventory_image = "spear_wood.png",
	wield_image = "spear_wood.png^[transformFX",
	range = 7,
	tool_capabilities = {
		full_punch_interval = 2,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=3.70, [2]=2.70, [3]=1.70}, uses=3, maxlevel=1},
		},
		damage_groups = {fleshy=.75},
	}
})

minetest.register_tool("lottgear:stone_spear", {
	description = "Stone Spear",
	inventory_image = "spear_stone.png",
	wield_image = "spear_stone.png^[transformFX",
	range = 7,
	tool_capabilities = {
		full_punch_interval = 1.50,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.75, [2]=1.75, [3]=0.75}, uses=5, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	}
})

minetest.register_tool("lottgear:copper_spear", {
	description = "Copper Spear",
	inventory_image = "spear_copper.png",
	wield_image = "spear_copper.png^[transformFX",
	range = 7,
	tool_capabilities = {
		full_punch_interval = 1.30,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.70, [2]=1.70, [3]=0.70}, uses=5, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	}
})

minetest.register_tool("lottgear:tin_spear", {
	description = "Tin Spear",
	inventory_image = "spear_tin.png",
	wield_image = "spear_tin.png^[transformFX",
	range = 7,
	tool_capabilities = {
		full_punch_interval = 1.30,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.70, [2]=1.70, [3]=0.70}, uses=5, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	}
})

minetest.register_tool("lottgear:steel_spear", {
	description = "Steel Spear",
	inventory_image = "spear_steel.png",
	wield_image = "spear_steel.png^[transformFX",
	range = 7,
	tool_capabilities = {
		full_punch_interval = 1.20,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.40, [2]=1.40, [3]=0.40}, uses=15, maxlevel=1},
		},
		damage_groups = {fleshy=5},
	}
})

minetest.register_tool("lottgear:bronze_spear", {
	description = "Bronze Spear",
	inventory_image = "spear_bronze.png",
	wield_image = "spear_bronze.png^[transformFX",
	range = 7,
	tool_capabilities = {
		full_punch_interval = 1.10,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.40, [2]=1.40, [3]=0.40}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=5.5},
	}
})

minetest.register_tool("lottgear:silver_spear", {
	description = "Silver Spear",
	inventory_image = "spear_silver.png",
	wield_image = "spear_silver.png^[transformFX",
	range = 7,
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.2, [2]=1.2, [3]=0.20}, uses=15, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("lottgear:gold_spear", {
	description = "Gold Spear",
	inventory_image = "spear_gold.png",
	wield_image = "spear_gold.png^[transformFX",
	range = 7,
	tool_capabilities = {
		full_punch_interval = 0.75,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.2, [2]=1.2, [3]=0.20}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("lottgear:galvorn_spear", {
	description = "Galvorn Spear",
	inventory_image = "spear_galvorn.png",
	wield_image = "spear_galvorn.png^[transformFX",
	range = 7,
     groups = {forbidden=1},
	tool_capabilities = {
		full_punch_interval = 0.50,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.3, [2]=1.3, [3]=0.30}, uses=25, maxlevel=1},
		},
		damage_groups = {fleshy=7},
	}
})

minetest.register_tool("lottgear:mithril_spear", {
	description = "Mithril Spear",
	inventory_image = "spear_mithril.png",
	wield_image = "spear_mithril.png^[transformFX",
	range = 7,
	tool_capabilities = {
		full_punch_interval = 0.25,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.00, [2]=1.00, [3]=0.20}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=8},
	}
})

-- Crafts
minetest.register_craft({
	output = 'lottgear:wood_spear',
	recipe = {
		{'', 'group:wood', ''},
		{'group:wood', 'group:stick', 'group:wood'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:stone_spear',
	recipe = {
		{'', 'default:cobble', ''},
		{'default:cobble', 'group:stick', 'default:cobble'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:copper_spear',
	recipe = {
		{'', 'default:copper_ingot', ''},
		{'default:copper_ingot', 'group:stick', 'default:copper_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:tin_spear',
	recipe = {
		{'', 'lottcosmos:tin_ingot', ''},
		{'lottcosmos:tin_ingot', 'group:stick', 'lottcosmos:tin_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:steel_spear',
	recipe = {
		{'', 'default:steel_ingot', ''},
		{'default:steel_ingot', 'group:stick', 'default:steel_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:bronze_spear',
	recipe = {
		{'', 'default:bronze_ingot', ''},
		{'default:bronze_ingot', 'group:stick', 'default:bronze_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:gold_spear',
	recipe = {
		{'', 'default:gold_ingot', ''},
		{'default:gold_ingot', 'group:stick', 'default:gold_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:silver_spear',
	recipe = {
		{'', 'lottcosmos:silver_ingot', ''},
		{'lottcosmos:silver_ingot', 'group:stick', 'lottcosmos:silver_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:galvorn_spear',
	recipe = {
		{'', 'lottcosmos:galvorn_ingot', ''},
		{'lottcosmos:galvorn_ingot', 'group:stick', 'lottcosmos:galvorn_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:mithril_spear',
	recipe = {
		{'', 'lottcosmos:mithril_ingot', ''},
		{'lottcosmos:mithril_ingot', 'group:stick', 'lottcosmos:mithril_ingot'},
		{'', 'group:stick', ''},
	}
})