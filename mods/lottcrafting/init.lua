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

local concat_recipe_table = function(items)
	local temp = {}
	for i = 1, #items do
		temp[i] = table.concat(items[i], " ")
	end
	return table.concat(temp, "/")
end

local get_recipe_string = function(items)
	if not items or not items[1] then return end
	local x1 = #items[1]
	local x2 = 0
	local y1 = #items
	local y2 = 0
	local last_x = 0
	for i, v1 in ipairs(items) do
		last_x = 0
		for j, v2 in ipairs(items[i]) do
			if v2 ~= "" then
				last_x = j
				if j < x1 then x1 = j end
			end
		end
		if last_x ~= 0 then
			if last_x > x2 then x2 = last_x end
			if i < y1 then y1 = i end
			if i > y2 then y2 = i end
		end
	end

	local t = {}
	for i = 1, y2 - y1 + 1 do
		t[i] = {}
		for j = 1, x2 - x1 + 1 do
			t[i][j] = items[i + y1 - 1][j + x1 - 1]
		end
	end
	return concat_recipe_table(t)
end

lottcrafting.register_craft = function(craft_attr, def)
	if not craft_attr or not def or not def.inputs then return end
	if not lottcrafting.recipes[craft_attr] then
		lottcrafting.recipes[craft_attr] = {}
	end
	local str = concat_recipe_table(def.inputs)
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
