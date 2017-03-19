function check_add_node(pos, name)
	local nn = minetest.get_node(pos).name
	if nn == "air" or minetest.get_item_group(nn, "sapling") then
		minetest.set_node(pos, name)
	end
end

function can_grow(pos)
	local node = minetest.get_node_or_nil({x = pos.x, y = pos.y, z = pos.z})
	if not node then
		return false
	end
	local growable_nodes = { "soil", "stone", "sand", "water" }
	for i, growable_node in ipairs (growable_nodes) do
		if minetest.get_item_group(node.name, growable_node) ~= 0 then
			return true
		end
	end
	if "air" == node.name then
		return true
	end
	return false
end

function large_roots(pos)
	for j = -5, 0 do
		for i = -1, 2 do
		for k = -1, 2 do
			if i == 0 and j == 0 and k == 0 then
				-- This is the sapling, ignore it
			elseif not can_grow({x = pos.x + i, y = pos.y + j, z = pos.z + k}) then
				return false
			end
		end
		end
	end
	return true
end

dofile(minetest.get_modpath("lottflora").."/tree/alder.lua")
dofile(minetest.get_modpath("lottflora").."/tree/apple.lua")
dofile(minetest.get_modpath("lottflora").."/tree/beech.lua")
dofile(minetest.get_modpath("lottflora").."/tree/birch.lua")
dofile(minetest.get_modpath("lottflora").."/tree/culumalda.lua")
dofile(minetest.get_modpath("lottflora").."/tree/elm.lua")
dofile(minetest.get_modpath("lottflora").."/tree/fir.lua")
dofile(minetest.get_modpath("lottflora").."/tree/lebethron.lua")
dofile(minetest.get_modpath("lottflora").."/tree/mallorn.lua")
dofile(minetest.get_modpath("lottflora").."/tree/mirktree.lua")
dofile(minetest.get_modpath("lottflora").."/tree/pine.lua")
dofile(minetest.get_modpath("lottflora").."/tree/plum.lua")
dofile(minetest.get_modpath("lottflora").."/tree/rowan.lua")
dofile(minetest.get_modpath("lottflora").."/tree/white.lua")
dofile(minetest.get_modpath("lottflora").."/tree/yavannamire.lua")