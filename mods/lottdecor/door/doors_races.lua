doors:register_door("dwarf_door", {
                            description = "Dwarf Door",
                            inventory_image = "door_dwarf.png",
                            groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
                            tiles_bottom = {"door_dwarf_side_top.png", "door_dwarf_side_bottom.png",
                                            "door_dwarf_side_right.png", "door_dwarf_side_left.png",
                                            "door_dwarf_b.png", "door_dwarf_b.png"},
                            tiles_top = {"door_dwarf_side_top.png", "door_dwarf_side_bottom.png",
                                         "door_dwarf_side_right.png", "door_dwarf_side_left.png",
                                         "door_dwarf_a.png", "door_dwarf_a.png"},
                            races = {GAMEdwarf = true}
})

doors:register_door("elven_door", {
                            description = "Elven Door",
                            inventory_image = "door_elven.png",
                            groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
                            tiles_bottom = {"door_dwarf_side_top.png", "door_dwarf_side_bottom.png",
                                            "door_dwarf_side_right.png", "door_dwarf_side_left.png",
                                            "door_elven_b.png", "door_elven_b.png"},
                            tiles_top = {"door_dwarf_side_top.png", "door_dwarf_side_bottom.png",
                                         "door_dwarf_side_right.png", "door_dwarf_side_left.png",
                                         "door_elven_a.png", "door_elven_a.png"},
                            races = {GAMEelf = true}
})

doors:register_door("hobbit_door", {
                            description = "Hobbit Door",
                            inventory_image = "door_hobbit.png",
                            groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
                            tiles_bottom = {"door_hobbit_side_top.png", "door_hobbit_side_bottom.png",
                                            "door_hobbit_side_right.png", "door_hobbit_side_left.png",
                                            "door_hobbit_b.png", "door_hobbit_b.png"},
                            tiles_top = {"door_hobbit_side_top.png", "door_hobbit_side_bottom.png",
                                         "door_hobbit_side_right.png", "door_hobbit_side_left.png",
                                         "door_hobbit_a.png", "door_hobbit_a.png"},
                            races = {GAMEhobbit = true}
})

doors:register_door("orc_door", {
                            description = "Orc Door",
                            inventory_image = "door_orc.png",
                            groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
                            tiles_bottom = {"door_orc_side_top.png", "door_orc_side_bottom.png",
                                            "door_orc_side_right.png", "door_orc_side_left.png",
                                            "door_orc_b.png", "door_orc_b.png"},
                            tiles_top = {"door_orc_side_top.png", "door_orc_side_bottom.png",
                                         "door_orc_side_right.png", "door_orc_side_left.png",
                                         "door_orc_a.png", "door_orc_a.png"},
                            races = {GAMEorc = true}
})

doors:register_door("men_door", {
                            description = "men Door",
                            inventory_image = "door_men.png",
                            groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
                            tiles_bottom = {"door_men_side_top.png", "door_men_side_bottom.png",
                                            "door_men_side_right.png", "door_men_side_left.png",
                                            "door_men_b.png", "door_men_b.png"},
                            tiles_top = {"door_men_side_top.png", "door_men_side_bottom.png",
                                         "door_men_side_right.png", "door_men_side_left.png",
                                         "door_men_a.png", "door_men_a.png"},
                            races = {GAMEman = true}
})

minetest.register_craft({
	output = "doors:hobbit_door",
	recipe = {
		{"lottplants:birchwood", "lottplants:birchwood"},
		{"lottplants:birchwood", "lottplants:birchwood"},
		{"lottplants:birchwood", "lottplants:birchwood"},
	}
})

minetest.register_craft({
	output = "doors:men_door",
	recipe = {
		{"lottplants:alderwood", "lottplants:alderwood"},
		{"lottplants:alderwood", "lottplants:alderwood"},
		{"lottplants:alderwood", "lottplants:alderwood"},
	}
})

minetest.register_craft({
	output = "doors:elven_door",
	recipe = {
		{"lottplants:mallornwood", "lottplants:mallornwood"},
		{"lottplants:mallornwood", "lottplants:mallornwood"},
		{"lottplants:mallornwood", "lottplants:mallornwood"},
	}
})

minetest.register_craft({
	output = "doors:orc_door",
	recipe = {
		{"lottmapgen:mordor_stone", "lottmapgen:mordor_stone"},
		{"lottmapgen:mordor_stone", "lottmapgen:mordor_stone"},
		{"lottmapgen:mordor_stone", "lottmapgen:mordor_stone"},
	}
})

minetest.register_craft({
	output = "doors:dwarf_door",
	recipe = {
		{"default:stone", "default:stone"},
		{"default:stone", "default:stone"},
		{"default:stone", "default:stone"},
	}
})
