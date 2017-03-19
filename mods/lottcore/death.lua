-- Minetest 0.4 mod: bones

grave_formspec =
	"size[8,9]"..
	"list[current_name;main;0,0;8,4;]"..
	"list[current_player;main;0,5;8,4;]"..
	"listring[]"..
  	"background[-0.5,-0.65;9,10.35;death_bg.png]"..
  	"listcolors[#606060AA;#606060;#141318;#30434C;#FFF]"

local function is_owner(pos, name)
	local owner = minetest.get_meta(pos):get_string("owner")
	if owner == "" or owner == name then
		return true
	end
	return false
end

local share_grave_time = tonumber(minetest.setting_get("share_grave_time")) or 1200
local grave_type = minetest.setting_get("grave_type") or "grave"

minetest.register_node("lottcore:grave", {
	description = "Grave",
	tiles = {"default_stone.png^[transformR90"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, 0.375, 0.25, 0.125, 0.4375},
			{-0.1875, 0.125, 0.375, 0.1875, 0.1875, 0.4375},
			{-0.25, -0.5, 0.25, 0.25, 0.1875, 0.375},
			{-0.25, -0.5, 0.1875, 0.25, 0.125, 0.25},
			{-0.1875, -0.5, 0.1875, 0.1875, 0.1875, 0.25},
			{-0.1875, -0.5, 0.1875, 0.1875, 0.1875, 0.4375},
			{-0.3125, -0.5, 0.125, 0.3125, -0.4375, 0.5},
		}
	},
	paramtype2 = "facedir",
	groups = {dig_immediate=2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),

	can_dig = function(pos, player)
		local inv = minetest.get_meta(pos):get_inventory()
		local name = ""
		if player then
			name = player:get_player_name()
		end
		return is_owner(pos, name) and inv:is_empty("main")
	end,

	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		if is_owner(pos, player:get_player_name()) then
			return count
		end
		return 0
	end,

	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		return 0
	end,

	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		if is_owner(pos, player:get_player_name()) then
			return stack:get_count()
		end
		return 0
	end,

	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if meta:get_string("owner") ~= "" and meta:get_inventory():is_empty("main") then
			meta:set_string("infotext", meta:get_string("owner").."'s old grave")
			meta:set_string("owner", "")
		end
	end,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
		meta:set_string("infotext", "Grave")
  		meta:set_string("formspec", grave_formspec)
	end,

	on_timer = function(pos, elapsed)
		local meta = minetest.get_meta(pos)
		local time = meta:get_int("time")+elapsed
		local publish = 1200
		if time >= share_grave_time then
			meta:set_string("infotext", meta:get_string("owner") .. "'s old grave")
			meta:set_string("owner", "")
		else
			meta:set_int("time", time)
			return true
		end
	end,
	
	on_blast = function(pos)
	end,

	on_punch = function(pos, node, player)
		if(not is_owner(pos, player:get_player_name())) then
			return
		end

		local inv = minetest.get_meta(pos):get_inventory()
		local player_inv = player:get_inventory()
		local has_space = true

		for i=1,inv:get_size("main") do
			local stk = inv:get_stack("main", i)
			if player_inv:room_for_item("main", stk) then
				inv:set_stack("main", i, nil)
				player_inv:add_item("main", stk)
			else
				has_space = false
				break
			end
		end
	end
})

local function may_replace(pos, player)
	local node_name = minetest.get_node(pos).name
	local node_definition = minetest.registered_nodes[node_name]

	-- if the node is unknown, we return false
	if not node_definition then
		return false
	end

	-- allow replacing air and liquids
	if node_name == "air" or node_definition.liquidtype ~= "none" then
		return true
	end

	-- don't replace filled chests and other nodes that don't allow it
	local can_dig_func = node_definition.can_dig
	if can_dig_func and not can_dig_func(pos, player) then
		return false
	end

	-- default to each nodes buildable_to; if a placed block would replace it, why shouldn't bones?
	-- flowers being squished by bones are more realistical than a squished stone, too
	-- exception are of course any protected buildable_to
	return node_definition.buildable_to and not minetest.is_protected(pos, player:get_player_name())
end

local drop = function(pos, itemstack)
	local obj = minetest.add_item(pos, itemstack:take_item(itemstack:get_count()))
	if obj then
		obj:setvelocity({
			x = math.random(-10, 10) / 9,
			y = 5,
			z = math.random(-10, 10) / 9,
		})
	end
end

minetest.register_on_dieplayer(function(player)

	if grave_type ~= "grave" and grave_type ~= "drop" and grave_type ~= "keep" then
		grave_type = "grave"
	end
		
	if grave_type == "keep" or minetest.setting_getbool("creative_mode") then
		return
	end

	local player_inv = player:get_inventory()
	if player_inv:is_empty("main") and
		player_inv:is_empty("craft") then
		return
	end
	
	local pos = vector.round(player:getpos())
	local player_name = player:get_player_name()

	if grave_type == "grave" and not may_replace(pos, player) then
		local air = minetest.find_node_near(pos, 1, {"air"})
		if air and not minetest.is_protected(air, player_name) then
			pos = air
		else
			grave_type = "drop"
		end
	end

	if grave_type == "drop" then

		-- drop inventory items
		for i = 1, player_inv:get_size("main") do
			drop(pos, player_inv:get_stack("main", i))
		end
		player_inv:set_list("main", {})

		-- drop crafting grid items
		for i = 1, player_inv:get_size("craft") do
			drop(pos, player_inv:get_stack("craft", i))
		end
		player_inv:set_list("craft", {})
		return
	end

	local param2 = minetest.dir_to_facedir(player:get_look_dir())
	minetest.set_node(pos, {name = "lottcore:grave", param2 = param2})

	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	inv:set_size("main", 8 * 4)
	inv:set_list("main", player_inv:get_list("main"))

	for i = 1, player_inv:get_size("craft") do
		local stack = player_inv:get_stack("craft", i)
		if inv:room_for_item("main", stack) then
			inv:add_item("main", stack)
		else
			--drop if no space left
			drop(pos, stack)
		end
	end

	player_inv:set_list("main", {})
	player_inv:set_list("craft", {})

	meta:set_string("formspec", grave_formspec)
	meta:set_string("owner", player_name)

	if share_grave_time ~= 0 then
		meta:set_string("infotext", player_name .. "'s fresh grave")

		minetest.get_node_timer(pos):start(10)
	else
		meta:set_string("infotext", player_name.."'s grave")
	end
end)