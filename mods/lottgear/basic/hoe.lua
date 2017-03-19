local farming = {}

--
-- Hoes
--
-- turns nodes with group soil=1 into soil
function farming.hoe_on_use(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	local under = minetest.get_node(pt.under)
	local p = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
	local above = minetest.get_node(p)

	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end

	-- check if the node above the pointed thing is air
	if above.name ~= "air" then
		return
	end

	-- check if pointing at dirt
	if minetest.get_item_group(under.name, "soil") ~= 1 then
		return
	end

	-- turn the node into soil, wear out item and play sound
	minetest.set_node(pt.under, {name="lottflora:soil"})
	minetest.sound_play("default_dig_crumbly", {
		pos = pt.under,
		gain = 0.5,
	})
	itemstack:add_wear(65535/(uses-1))
	return itemstack
end

minetest.register_tool("lottgear:hoe_wood", {
	description = "Wooden Hoe",
	inventory_image = "hoe_wood.png",

	on_use = function(itemstack, user, pointed_thing)
		return farming.hoe_on_use(itemstack, user, pointed_thing, 30)
	end,
})

minetest.register_tool("lottgear:hoe_stone", {
	description = "Stone Hoe",
	inventory_image = "hoe_stone.png",

	on_use = function(itemstack, user, pointed_thing)
		return farming.hoe_on_use(itemstack, user, pointed_thing, 90)
	end,
})

minetest.register_tool("lottgear:hoe_steel", {
	description = "Steel Hoe",
	inventory_image = "hoe_steel.png",

	on_use = function(itemstack, user, pointed_thing)
		return farming.hoe_on_use(itemstack, user, pointed_thing, 200)
	end,
})

minetest.register_tool("lottgear:hoe_bronze", {
	description = "Bronze Hoe",
	inventory_image = "hoe_bronze.png",

	on_use = function(itemstack, user, pointed_thing)
		return farming.hoe_on_use(itemstack, user, pointed_thing, 220)
	end,
})

-- Crafting
minetest.register_craft({
	output = "lottgear:hoe_wood",
	recipe = {
		{"group:wood", "group:wood"},
		{"", "group:stick"},
		{"", "group:stick"},
	}
})

minetest.register_craft({
	output = "lottgear:hoe_stone",
	recipe = {
		{"group:stone", "group:stone"},
		{"", "group:stick"},
		{"", "group:stick"},
	}
})

minetest.register_craft({
	output = "lottgear:hoe_steel",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot"},
		{"", "group:stick"},
		{"", "group:stick"},
	}
})

minetest.register_craft({
	output = "lottgear:hoe_bronze",
	recipe = {
		{"default:bronze_ingot", "default:bronze_ingot"},
		{"", "group:stick"},
		{"", "group:stick"},
	}
})