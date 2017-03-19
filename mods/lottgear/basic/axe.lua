minetest.register_tool("lottgear:copperaxe", {
	description = "Copper Axe",
	inventory_image = "axe_copper.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("lottgear:tinaxe", {
	description = "Tin Axe",
	inventory_image = "axe_tin.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=25, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("lottgear:silveraxe", {
	description = "Silver Axe",
	inventory_image = "axe_silver.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.30, [2]=1.20, [3]=0.80}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("lottgear:goldaxe", {
	description = "Gold Axe",
	inventory_image = "axe_gold.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.30, [2]=1.20, [3]=0.80}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("lottgear:galvornaxe", {
	description = "Galvorn Axe",
	inventory_image = "axe_galvorn.png",
     groups = {forbidden=1},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("lottgear:mithrilaxe", {
	description = "Mithril Axe",
	inventory_image = "axe_mithril.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.80, [2]=0.60, [3]=0.30}, uses=60, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
})

-- Crafting
minetest.register_craft({
	output = 'lottgear:copperaxe',
	recipe = {
		{'default:copper_ingot', 'default:copper_ingot'},
		{'default:copper_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:tinaxe',
	recipe = {
		{'lottgear:tin_ingot', 'lottgear:tin_ingot'},
		{'lottgear:tin_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:silveraxe',
	recipe = {
		{'lottgear:silver_ingot', 'lottgear:silver_ingot'},
		{'lottgear:silver_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:goldaxe',
	recipe = {
		{'default:gold_ingot', 'default:gold_ingot'},
		{'default:gold_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:galvornaxe',
	recipe = {
		{'lottgear:galvorn_ingot', 'lottgear:galvorn_ingot'},
		{'lottgear:galvorn_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:mithrilaxe',
	recipe = {
		{'lottgear:mithril_ingot', 'lottgear:mithril_ingot'},
		{'lottgear:mithril_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})