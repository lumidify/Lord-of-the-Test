minetest.register_tool("lottgear:coppersword", {
	description = "Copper Sword",
	inventory_image = "sword_copper.png",
	tool_capabilities = {
		full_punch_interval = 1.25,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("lottgear:tinsword", {
	description = "Tin Sword",
	inventory_image = "sword_tin.png",
	tool_capabilities = {
		full_punch_interval = 1.25,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=35, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("lottgear:silversword", {
	description = "Silver Sword",
	inventory_image = "sword_silver.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.3, [2]=1.10, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("lottgear:goldsword", {
	description = "Gold Sword",
	inventory_image = "sword_gold.png",
	tool_capabilities = {
		full_punch_interval = 0.75,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.3, [2]=1.10, [3]=0.35}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("lottgear:galvornsword", {
	description = "Galvorn Sword",
	inventory_image = "sword_galvorn.png",
     groups = {forbidden=1},
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	}
})

minetest.register_tool("lottgear:mithrilsword", {
	description = "Mithril Sword",
	inventory_image = "sword_mithril.png",
	tool_capabilities = {
		full_punch_interval = 0.25,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.70, [2]=0.80, [3]=0.25}, uses=80, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	}
})

-- Crafting
minetest.register_craft({
	output = 'lottgear:coppersword',
	recipe = {
		{'default:copper_ingot'},
		{'default:copper_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:tinsword',
	recipe = {
		{'lottgear:tin_ingot'},
		{'lottgear:tin_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:silversword',
	recipe = {
		{'lottgear:silver_ingot'},
		{'lottgear:silver_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:goldsword',
	recipe = {
		{'default:gold_ingot'},
		{'default:gold_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:galvornsword',
	recipe = {
		{'lottgear:galvorn_ingot'},
		{'lottgear:galvorn_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:mithrilsword',
	recipe = {
		{'lottgear:mithril_ingot'},
		{'lottgear:mithril_ingot'},
		{'group:stick'},
	}
})