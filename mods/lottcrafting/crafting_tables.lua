local get_formspec = function(adj, texture)
	return "size[8,10]"..
	"label[2.5,0;"..adj.." Crafting Table]"..
	"label[1,1;Inputs]"..
	"label[6,1;Outputs]"..
	"list[context;src;0,2;3,3]"..
	"button[3,3;2,1;craft_button;Craft]"..
	"list[context;dst;5,2;3,3]"..
	"list[current_player;main;0,6;8,4]"..
	"listring[context;dst]"..
	"listring[current_player;main]"..
	"listring[context;src]"..
	"listring[current_player;main]"..
	"background[-0.5,-0.5;9,11;gui_"..texture.."bg.png]"
end

local check_privs = function(player, priv, nounp, count)
	local name = player:get_player_name()
	if not minetest.check_player_privs(name, {[priv]=true}) then
		minetest.chat_send_player(name, "Only "..nounp.." may use this crafting table.")
		return 0
	end
	return count
end

local register_crafting_table = function(adj, noun, nounp, priv, texture)
	minetest.register_node("lottcrafting:"..noun.."_table", {
		description = adj.." Crafting Table",
		tiles = {"lottblocks_"..texture.."_chest_top.png", "default_wood.png"},
		groups = {choppy=2,oddly_breakable_by_hand=2},
		is_ground_content = false,
		drawtype = "nodebox",
		sunlight_propagates = true,
		paramtype = 'light',
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.4,-0.5,-0.4, -0.3,0.4,-0.3},
				{0.3,-0.5,-0.4, 0.4,0.4,-0.3},
				{-0.4,-0.5,0.3, -0.3,0.4,0.4},
				{0.3,-0.5,0.3, 0.4,0.4,0.4},
				{-0.5,0.4,-0.5, 0.5,0.5,0.5},
				{-0.4,-0.2,-0.3, -0.3,-0.1,0.3},
				{0.3,-0.2,-0.4, 0.4,-0.1,0.3},
				{-0.3,-0.2,-0.4, 0.4,-0.1,-0.3},
				{-0.3,-0.2,0.3, 0.3,-0.1,0.4},
			},
		},
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			meta:set_string("infotext", adj.." Crafting Table")
			inv:set_size("src", 9)
			inv:set_width("src", 3)
			inv:set_size("dst", 9)
			meta:set_string("formspec", get_formspec(adj, texture))
		end,
		allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
			return check_privs(player, priv, nounp, count)
		end,
		allow_metadata_inventory_put = function(pos, listname, index, stack, player)
			return check_privs(player, priv, nounp, stack:get_count())
		end,
		allow_metadata_inventory_take = function(pos, listname, index, stack, player)
			return check_privs(player, priv, nounp, stack:get_count())
		end,
		can_dig = function(pos, player)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			if not inv:is_empty("src") or not inv:is_empty("dst") then
				return false
			end
			return true
		end,
		on_receive_fields = function(pos, formname, fields, sender)
			local name = sender:get_player_name()
			if not minetest.check_player_privs(name, {[priv]=true}) then
				minetest.chat_send_player(name, "Only "..nounp.." may use this crafting table.")
				return
			end
			if fields.craft_button and fields.craft_button ~= "" then
				local meta = minetest.get_meta(pos)
				local inv = meta:get_inventory()
				if inv:is_empty("src") then return end
				local src_list = inv:get_list("src")
				local def = lottcrafting.get_craft_result(noun, inv:get_width("src"), src_list)
				lottcrafting.handle_craft(def, inv, "src", "dst")
			end
		end,
	})
end

-- TODO: possibly add separate crafting tables for different types of men
-- (when different players are added for that)
register_crafting_table("Dwarven", "dwarf", "dwarves", "GAMEdwarf", "dwarf")
register_crafting_table("Human", "men", "humans", "GAMEman", "rohan")
register_crafting_table("Orcish", "orc", "orcs", "GAMEorc", "mordor")
register_crafting_table("Elven", "elf", "elves", "GAMEelf", "elf")
register_crafting_table("Hobbit", "hobbit", "hobbits", "GAMEhobbit", "hobbit")
