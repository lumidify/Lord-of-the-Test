minetest.register_tool("lottgear:wood_dagger", {
	description = "Training Dagger",
	inventory_image = "dagger_wood.png",
	range = 3,
	tool_capabilities = {
		full_punch_interval = 2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=2.25, [3]=1.75}, uses=2, maxlevel=1},
		},
		damage_groups = {fleshy=.10},
	}
})

minetest.register_tool("lottgear:stone_dagger", {
	description = "Stone Dagger",
	inventory_image = "dagger_stone.png",
	range = 3,
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.35, [3]=0.85}, uses=5, maxlevel=1},
		},
		damage_groups = {fleshy=.90},
	}
})

minetest.register_tool("lottgear:copper_dagger", {
	description = "Copper Dagger",
	inventory_image = "dagger_copper.png",
	range = 3,
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.25, [3]=0.75}, uses=5, maxlevel=1},
		},
		damage_groups = {fleshy=2.5},
	}
})

minetest.register_tool("lottgear:tin_dagger", {
	description = "Tin Dagger",
	inventory_image = "dagger_tin.png",
	range = 3,
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.25, [3]=0.75}, uses=5, maxlevel=1},
		},
		damage_groups = {fleshy=2.5},
	}
})

minetest.register_tool("lottgear:steel_dagger", {
	description = "Steel Dagger",
	inventory_image = "dagger_steel.png",
	range = 3,
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.00, [3]=0.50}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	}
})

minetest.register_tool("lottgear:bronze_dagger", {
	description = "Bronze Dagger",
	inventory_image = "dagger_bronze.png",
	range = 3,
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.00, [3]=0.50}, uses=15, maxlevel=1},
		},
		damage_groups = {fleshy=4.5},
	}
})

minetest.register_tool("lottgear:silver_dagger", {
	description = "Silver Dagger",
	inventory_image = "dagger_silver.png",
	range = 3,
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=.80, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=5},
	}
})

minetest.register_tool("lottgear:gold_dagger", {
	description = "Gold Dagger",
	inventory_image = "dagger_gold.png",
	range = 3,
	tool_capabilities = {
		full_punch_interval = .6,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=.80, [3]=0.40}, uses=15, maxlevel=1},
		},
		damage_groups = {fleshy=5},
	}
})

minetest.register_tool("lottgear:galvorn_dagger", {
	description = "Galvorn Dagger",
	inventory_image = "dagger_galvorn.png",
	range = 3,
     groups = {forbidden=1},
	tool_capabilities = {
		full_punch_interval = .5,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=.90, [3]=0.45}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=5.5},
	}
})

minetest.register_tool("lottgear:mithril_dagger", {
	description = "Mithril Dagger",
	inventory_image = "dagger_mithril.png",
	range = 3,
	tool_capabilities = {
		full_punch_interval = .25,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=.75, [3]=0.35}, uses=25, maxlevel=2},
		},
		damage_groups = {fleshy=6.5},
	}
})

-- Crafts
minetest.register_craft({
	output = 'lottgear:wood_dagger',
	recipe = {
		{'group:wood'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:stone_dagger',
	recipe = {
		{'default:cobble'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:copper_dagger',
	recipe = {
		{'default:copper_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:tin_dagger',
	recipe = {
		{'lottcosmos:tin_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:steel_dagger',
	recipe = {
		{'default:steel_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:bronze_dagger',
	recipe = {
		{'default:bronze_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:silver_dagger',
	recipe = {
		{'lottcosmos:silver_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:gold_dagger',
	recipe = {
		{'default:gold_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:galvorn_dagger',
	recipe = {
		{'lottcosmos:galvorn_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'lottgear:mithril_dagger',
	recipe = {
		{'lottcosmos:mithril_ingot'},
		{'group:stick'},
	}
})