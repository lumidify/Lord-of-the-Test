lottcrafting = {}
lottcrafting.recipes = {}
lottcrafting.recipes.shaped = {}
lottcrafting.recipes.shapeless = {}

lottcrafting.handle_craft = function(def, inv, src_name, dst_name, player)
	if not def then return end
	local can_add = true
	for _, item in ipairs(def.outputs) do
		if not inv:room_for_item(dst_name, ItemStack(item)) then
			can_add = false
			if player then minetest.chat_send_player(player:get_player_name(), "Output inventory full!") end
			break
		end
	end
	if can_add then
		for _, item in ipairs(def.outputs) do
			inv:add_item(dst_name, ItemStack(item))
		end
		for k, v in ipairs(def.inputs) do
			-- FIXME: Maybe turn shaped recipes into 1D tables when they are
			-- registered so this can be simplified
			if type(v) == "table" then
				for _, item in ipairs(v) do
					inv:remove_item(src_name, ItemStack(item))
				end
			else
				inv:remove_item(src_name, ItemStack(v))
			end
		end
	end
end

local concat_shaped_table = function(namelist)
	local temp = {}
	for i = 1, #namelist do
		temp[i] = table.concat(namelist[i], " ")
	end
	return table.concat(temp, "/")
end

local get_str_shaped = function(namelist)
	if not namelist or not namelist[1] then return end
	local x1 = #namelist[1]
	local x2 = 0
	local y1 = #namelist
	local y2 = 0
	local last_x = 0
	for i, v1 in ipairs(namelist) do
		last_x = 0
		for j, v2 in ipairs(v1) do
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
			t[i][j] = namelist[i + y1 - 1][j + x1 - 1]
		end
	end
	return concat_shaped_table(t)
end

local get_str_shapeless = function(namelist)
	local temp = {}
	for i, v1 in ipairs(namelist) do
		for j, v2 in ipairs(v1) do
			if v2 ~= "" then
				temp[#temp+1] = v2
			end
		end
	end
	table.sort(temp)
	return table.concat(temp, " ")
end

lottcrafting.register_craft = function(craft_type, craft_attr, def)
	if not craft_type or not craft_attr or not def or not def.inputs then return end
	if not lottcrafting.recipes[craft_type][craft_attr] then
		lottcrafting.recipes[craft_type][craft_attr] = {}
	end
	local str = nil
	if craft_type == "shaped" then
		str = concat_recipe_table(def.inputs)
	elseif craft_type == "shapeless" then
		table.sort(def.inputs)
		str = table.concat(def.inputs, " ")
	end
	if lottcrafting.recipes[craft_type][craft_attr][str] then
		-- Yes, I know this will look really ugly when printed...
		minetest.log("warning", "[lottcrafting] Duplicate registration for recipe \""..str.."\"")
	end
	lottcrafting.recipes[craft_type][craft_attr][str] = def
end

local get_namelist = function(itemlist, width)
	local namelist = {}
	for i = 1, (#itemlist / width) do
		namelist[i] = {}
		for j = 1, width do
			namelist[i][j] = itemlist[(i - 1) * width + j]:get_name()
		end
	end
	return namelist
end

local get_craft_result_intern = function(craft_type, craft_attr, namelist)
	local str = nil
	if craft_type == "shaped" then
		str = get_str_shaped(namelist)
	elseif craft_type == "shapeless" then
		str = get_str_shapeless(namelist)
	end
	return lottcrafting.recipes[craft_type][craft_attr][str]
end

lottcrafting.get_craft_result_namelist = function(craft_attr, namelist, craft_type)
	if not craft_attr or not namelist then return end
	local def = nil
	if craft_type then
		if not lottcrafting.recipes[craft_type][craft_attr] then return end
		def = get_craft_result_intern(craft_type, craft_attr, namelist)
	else
		if not lottcrafting.recipes["shaped"][craft_attr] and not
			lottcrafting.recipes["shapeless"][craft_attr] then return end
		def = get_craft_result_intern("shapeless", craft_attr, namelist)
		if not def then def = get_craft_result_intern("shaped", craft_attr, namelist) end
	end
	return def
end

lottcrafting.get_craft_result = function(craft_attr, width, itemlist, craft_type)
	if not craft_attr or not width or not itemlist then return end
	local namelist = get_namelist(itemlist, width)
	return lottcrafting.get_craft_result_namelist(craft_attr, namelist, craft_type)
end

lottcrafting.register_craft("shapeless", "dwarf", {
	inputs = {"default:torch"},
	outputs = {"default:stone"},
})

lottcrafting.register_craft("shapeless", "smelting", {
	inputs = {"lottores:silver_lump"},
	outputs = {"lottores:silver_ingot"},
	time = 3,
})

dofile(minetest.get_modpath("lottcrafting").."/crafting_tables.lua")
dofile(minetest.get_modpath("lottcrafting").."/furnaces.lua")
dofile(minetest.get_modpath("lottcrafting").."/farming.lua")
dofile(minetest.get_modpath("lottcrafting").."/crafts.lua")
