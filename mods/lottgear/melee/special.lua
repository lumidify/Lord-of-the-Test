minetest.register_tool("lottgear:bone_scythe", {
	description = "Bone Scythe",
	inventory_image = "special_bone_scythe.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	}
})

minetest.register_craft({
	output = 'lottgear:bone_scythe',
	recipe = {
		{'lottdecor:skeleton', 'lottdecor:skeleton', ''},
		{'', 'default:steel', ''},
		{'', 'default:steel',''},
	}
})

minetest.register_tool("lottgear:elven_sword", {
	description = "Elven Sword",
	inventory_image = "sword_elven.png",
	tool_capabilities = {
		full_punch_interval = 0.25,
		max_drop_level=2,
		groupcaps={
			snappy={times={[1]=1.60, [2]=1.30, [3]=0.90}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy=7.5},
	}
})

minetest.register_tool("lottgear:orc_sword", {
	description = "Orcish Sword",
	inventory_image = "sword_orc.png",
	tool_capabilities = {
		full_punch_interval = 0.75,
		max_drop_level=2,
		groupcaps={
			snappy={times={[1]=2.25, [2]=1.80, [3]=1.30}, uses=17, maxlevel=3},
		},
		damage_groups = {fleshy=6.5},
	}
})

minetest.register_craft({
	output = 'lottgear:elven_sword',
	recipe = {
		{'', 'default:steel_ingot', ''},
		{'default:bronze_ingot', 'default:steel_ingot', 'default:bronze_ingot'},
		{'default:mese_crystal', 'group:stick', 'default:mese_crystal'},
	}
})

minetest.register_craft({
	output = 'lottgear:orc_sword',
	recipe = {
		{'', 'lottcosmos:orc_steel_ingot', 'lottcosmos:orc_steel_ingot'},
		{'', 'lottcosmos:orc_steel_ingot', ''},
		{'', 'group:stick', ''},
	}
})