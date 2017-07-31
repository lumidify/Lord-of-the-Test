lottcrafting = {}
lottcrafting.recipes = {}

lottcrafting.handle_craft = function(def, inv, src_name, dst_name)
	if not def then return end
	local can_add = true
	for _, item in ipairs(def.outputs) do
		if not inv:room_for_item(dst_name, ItemStack(item)) then
			can_add = false
			break
		end
	end
	if can_add then
		for _, item in ipairs(def.outputs) do
			inv:add_item(dst_name, ItemStack(item))
		end
		for k, v in ipairs(def.inputs) do
			for _, item in ipairs(v) do
				inv:remove_item(src_name, ItemStack(item))
			end
		end
	end
end

local find_x = function(start, stop, step, items, default)
	local pos = nil
	local found = false
	for i = start, stop, step do
		found = false
		for j = 1, #items do
			if items[j][i] ~= "" then
				found = true
				break
			end
		end
		if not pos and found then
			pos = i
			break
		end
	end
	if not pos then pos = default end
	return pos
end

local find_y = function(start, stop, step, items, default)
	local pos = nil
	local found = false
	for j = start, stop, step do
		found = false
		for i = 1, #items[1] do
			if items[j][i] ~= "" then
				found = true
				break
			end
		end
		if not pos and found then
			pos = j
			break
		end
	end
	if not pos then pos = default end
	return pos
end

-- Please tell me there's a more efficient way to do this...
-- I can't even believe how ugly this is.
-- Purpose: "shrinkwrap" the grid - find smallest rectangle which
--          includes all non-empty strings
local get_recipe_string = function(items)
	if not items or not items[1] then return end
	local l = {}
	local x1 = find_x(1, #items[1], 1, items, 1)
	local x2 = find_x(#items[1], 1, -1, items, #items[1])
	local y1 = find_y(1, #items, 1, items, 1)
	local y2 = find_y(#items, 1, -1, items, #items)

	for i = 1, y2 - y1 + 1 do
		l[i] = {}
		for j = 1, x2 - x1 + 1 do
			l[i][j] = items[i + y1 - 1][j + x1 - 1]
		end
	end
	for i = 1, #l do
		l[i] = table.concat(l[i], " ")
	end
	return table.concat(l, "/")
end

lottcrafting.register_craft = function(craft_attr, def)
	if not craft_attr or not def or not def.inputs then return end
	if not lottcrafting.recipes[craft_attr] then
		lottcrafting.recipes[craft_attr] = {}
	end
	local str = get_recipe_string(def.inputs)
	if not str then return end
	if lottcrafting.recipes[craft_attr][str] then
		-- Yes, I know this will look really ugly when printed...
		minetest.log("warning", "[lottcrafting] Duplicate registration for recipe \""..str.."\"")
	end
	lottcrafting.recipes[craft_attr][str] = def
end

lottcrafting.get_craft_result = function(craft_attr, width, itemlist)
	if not craft_attr or not lottcrafting.recipes[craft_attr] or not itemlist then return end
	local namelist = {}
	for i = 1, (#itemlist / width) do
		namelist[i] = {}
		for j = 1, width do
			namelist[i][j] = itemlist[(i - 1) * width + j]:get_name()
		end
	end

	return lottcrafting.recipes[craft_attr][get_recipe_string(namelist)]
end

lottcrafting.register_craft("dwarf", {
	inputs = {{"default:torch"}},
	outputs = {"default:stone"},
})

lottcrafting.register_craft("smelting", {
	inputs = {{"lottores:silver_lump"}},
	outputs = {"lottores:silver_ingot"},
	time = 3,
})

dofile(minetest.get_modpath("lottcrafting").."/crafting_tables.lua")
dofile(minetest.get_modpath("lottcrafting").."/furnaces.lua")
