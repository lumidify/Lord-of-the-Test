doors.register_trapdoor("trapdoor", {
	description = "Trapdoor",
	inventory_image = "door_trapdoor.png",
	wield_image = "door_trapdoor.png",
	tile_open = "door_trapdoor_open.png",
	tile_closed = "door_trapdoor.png",
	tile_side = "door_trapdoor_side.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'doors:trapdoor',
	recipe = {
		{'default:wood', 'default:wood'},
		{'default:wood', 'default:wood'},
	}
})