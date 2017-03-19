minetest.register_tool("lottgear:coppershovel", {
	description = "Copper Shovel",
	inventory_image = "shovel_copper.png",
	wield_image = "shovel_copper.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("lottgear:tinshovel", {
	description = "Tin Shovel",
	inventory_image = "shovel_tin.png",
	wield_image = "shovel_tin.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=35, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("lottgear:silvershovel", {
	description = "Silver Shovel",
	inventory_image = "shovel_silver.png",
	wield_image = "shovel_silver.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.30, [2]=0.70, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("lottgear:goldshovel", {
	description = "Gold Shovel",
	inventory_image = "shovel_gold.png",
	wield_image = "shovel_gold.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.30, [2]=0.70, [3]=0.35}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("lottgear:galvornshovel", {
	description = "Galvorn Shovel",
	inventory_image = "shovel_galvorn.png",
	wield_image = "shovel_galvorn.png^[transformR90",
     groups = {forbidden=1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("lottgear:mithrilshovel", {
	description = "Mithril Shovel",
	inventory_image = "shovel_mithril.png",
	wield_image = "shovel_mithril.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=0.90, [2]=0.40, [3]=0.20}, uses=60, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
})

-- Crafting
minetest.register_craft({
	output = 'lottgear:coppershovel',
	recipe = {
		{'default:copper_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:tinshovel',
	recipe = {
		{'lottgear:tin_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:silvershovel',
	recipe = {
		{'lottgear:silver_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:goldshovel',
	recipe = {
		{'default:gold_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:galvornshovel',
	recipe = {
		{'lottgear:galvorn_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:mithrilshovel',
	recipe = {
		{'lottgear:mithril_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})