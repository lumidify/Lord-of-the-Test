local wl = minetest.get_mapgen_setting("water_level")

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "lottcosmos:blue_gem_ore",
	wherein        = "default:stone",
	clust_scarcity = 14*14*14,
	clust_num_ores = 4,
	clust_size     = 2,
	y_min     = wl - 31000,
	y_max     = wl - 256,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "lottcosmos:red_gem_ore",
	wherein        = "default:stone",
	clust_scarcity = 14*14*14,
	clust_num_ores = 4,
	clust_size     = 2,
	y_min     = wl - 31000,
	y_max     = wl - 256,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "lottcosmos:purple_gem_ore",
	wherein        = "default:stone",
	clust_scarcity = 14*14*14,
	clust_num_ores = 4,
	clust_size     = 2,
	y_min     = wl - 31000,
	y_max     = wl - 256,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "lottcosmos:white_gem_ore",
	wherein        = "default:stone",
	clust_scarcity = 14*14*14,
	clust_num_ores = 4,
	clust_size     = 2,
	y_min     = wl - 31000,
	y_max     = wl - 256,
})