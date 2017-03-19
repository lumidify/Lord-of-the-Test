function doors.register_trapdoor(name, def)
	local name_closed = "doors:"..name
	local name_opened = "doors:"..name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	-- Common trapdoor configuration
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	}
	def_closed.tiles = { def.tile_closed, def.tile_closed, def.tile_side, def.tile_side,
		def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_side, def.tile_side,
		def.tile_open, def.tile_open }
	def_opened.drop = name_closed
	def_opened.climbable = true
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(":"..name_opened, def_opened)
	minetest.register_node(":"..name_closed, def_closed)
end



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