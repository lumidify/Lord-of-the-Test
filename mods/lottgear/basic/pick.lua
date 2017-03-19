minetest.register_tool("lottgear:copperpick", {
	description = "Copper Pickaxe",
	inventory_image = "pick_copper.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("lottgear:tinpick", {
	description = "Tin Pickaxe",
	inventory_image = "pick_tin.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=25, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("lottgear:silverpick", {
	description = "Silver Pickaxe",
	inventory_image = "pick_silver.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=2,
		groupcaps={
			cracky = {times={[1]=3.00, [2]=1.40, [3]=0.70}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("lottgear:goldpick", {
	description = "Gold Pickaxe",
	inventory_image = "pick_gold.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=2,
		groupcaps={
			cracky = {times={[1]=3.00, [2]=1.40, [3]=0.70}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("lottgear:galvornpick", {
	description = "Galvorn Pickaxe",
	inventory_image = "pick_galvorn.png",
     groups = {forbidden=1},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
})

minetest.register_tool("lottgear:mithrilpick", {
	description = "Mithril Pickaxe",
	inventory_image = "pick_mithril.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=1.5, [2]=0.8, [3]=0.40}, uses=60, maxlevel=3},
			very_hard = {times={[1]=3.5, [2]=1.5, [3]=0.90}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
})

-- Crafting
minetest.register_craft({
	output = 'lottgear:copperpick',
	recipe = {
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:tinpick',
	recipe = {
		{'lottgear:tin_ingot', 'lottgear:tin_ingot', 'lottgear:tin_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:silverpick',
	recipe = {
		{'lottgear:silver_ingot', 'lottgear:silver_ingot', 'lottgear:silver_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:goldpick',
	recipe = {
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:galvornpick',
	recipe = {
		{'lottgear:galvorn_ingot', 'lottgear:galvorn_ingot', 'lottgear:galvorn_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'lottgear:mithrilpick',
	recipe = {
		{'lottgear:mithril_ingot', 'lottgear:mithril_ingot', 'lottgear:mithril_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})