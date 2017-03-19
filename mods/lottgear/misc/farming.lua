local function decaying_wood(pos, inv, p)
	if pos == nil then
		return false
	end
	local node = minetest.get_node(pos)
	local name = node.name
	local above = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z})
	if name == "default:tree" or name == "default:jungletree" then
		if above.name == "air" then
			node.name = "lottflora:decay_tree"
			minetest.set_node(pos, node)
			return true
		end
	end
	return false
end

minetest.register_tool("lottgear:bacteria_fertiliser", {
	description = "Bacteria Fertiliser",
	inventory_image = "farming_bacteria_fertiliser.png",
	on_use = function(itemstack, user, pointed_thing)
		if decaying_wood(pointed_thing.under, user:get_inventory(), 10) then
			itemstack:add_wear(65535/80)
			return itemstack
		end
	end
})

minetest.register_craft({
	output = "lottgear:bacteria_fertiliser",
	recipe = {
		{"default:glass", "", "default:glass"},
		{"default:glass", "lottdecor:bone", "default:glass"},
		{"default:glass", "default:glass", "default:glass"},
	}
})