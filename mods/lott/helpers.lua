inventory_plus = {}

inventory_plus.set_inventory_formspec = function(player, formspec)
	minetest.show_formspec(player:get_player_name(), "custom", formspec)
end

inventory_plus.replace_inventory_formspec = function(player, formspec)
	player:set_inventory_formspec(formspec)
end

minetest.register_on_player_receive_fields(function(player,formname,fields)
	if fields.main then
		local name = player:get_player_name()
	     local formspec_armor = armor:get_armor_formspec(name)
	     minetest.show_formspec(player:get_player_name(), "armor", formspec_armor)
	end
end)