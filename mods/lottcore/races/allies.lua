races.allies = {
        GAMEelf = {
                GAMEman = true,
                GAMEorc = false,
                GAMEhobbit = true,
                GAMEdwarf = true
        },
        GAMEman = {
                GAMEelf = true,
                GAMEorc = false,
                GAMEhobbit = true,
                GAMEdwarf = true
        },
        GAMEorc = {
                GAMEelf = false,
                GAMEman = false,
                GAMEhobbit = false,
                GAMEdwarf = false
        },
        GAMEhobbit = {
                GAMEelf = true,
                GAMEman = true,
                GAMEorc = false,
                GAMEdwarf = true
        },
        GAMEdwarf = {
                GAMEelf = true,
                GAMEman = true,
                GAMEorc = false,
                GAMEhobbit = true
        }
}

races.races = {
        "GAMEelf",
        "GAMEman",
        "GAMEorc",
        "GAMEhobbit",
        "GAMEdwarf"
}

races.races_prefix = {
        "Elven",
        "Human",
        "Orc",
        "Hobbit",
        "Dwarven"
}

races.races_pretty = {
        "Elves",
        "Men",
        "Orcs",
        "Hobbits",
        "Dwarves"
}

races.player_same_race_or_ally = function(player, race)
        local player_privs = minetest.get_player_privs(player:get_player_name())
        local player_race = nil
        for i, v in pairs(races.races) do
                player_race = nil
                if player_privs[v] then
                        player_race = v
                end
                if player_race == race or races.allies[race][player_race] then
                        return true
                end
        end
        return false
end

races.player_race_in_table = function(player, races)
        local player_privs = minetest.get_player_privs(player:get_player_name())
        for i, v in pairs(races) do
                if player_privs[i] then
                        return true
                end
        end
        return false
end

races.lua_ent_same_race_or_ally = function(lua_ent, race)
        if not race or race == "" or not lua_ent.race or lua_ent.race == "" then
                return false
        end
        if race == "ents" then
                if lua_ent.race == "ents" then
                        return true
                end
                return false
        end
        if lua_ent.type == "npc" and (lua_ent.race == "ents" or race == lua_ent.race or races.allies[race][lua_ent.race]) then
                return true
        end
end

races.npc_same_race_or_ally = function(npc, race)
        local lua_ent = npc:get_luaentity()
        if lua_ent then
                return races.lua_ent_same_race_or_ally(lua_ent, race)
        end
        return false
end

races.obj_same_race_or_ally = function(obj, race)
        local player_race = nil
        if obj:is_player() then
                return races.player_same_race_or_ally(obj, race)
        else
                return races.npc_same_race_or_ally(obj, race)
        end

        return false
end

local file = io.open(minetest.get_worldpath().."/"..SAVEDIR.."/allies.txt", "r")
if file then
	races.allies = minetest.deserialize(file:read("*all"))
	file:close()
end

minetest.register_privilege("allies", {
                description = "Can change the allies",
})

minetest.register_chatcommand("allies", {
	params = "",
	description = "Change Allies",
	func = function(name, param)
		races.show_allies_formspec(name)
	end,
})

races.show_allies_formspec = function(player)
        local x, y = nil
        local player_privs = minetest.get_player_privs(player)
        if not player_privs.allies then return end
        local formspec = "size[8,12]label[0,0;Allies:]"
        y = 1
        for i = 1, 5, 1 do
                if player_privs.server or player_privs[races.races[i]] then
                        formspec = formspec.."label[0,"..y..";"..races.races_pretty[i]..":]"
                        x = 0
                        for j = 1, 5, 1 do
                                if races.races[i] ~= races.races[j] then
                                        formspec = formspec..
                                                "checkbox["..x..","..(y + 1)..";"..races.races[i].."_"..
                                                races.races[j]..";"..races.races_pretty[j]..";"..
                                                tostring(races.allies[races.races[i]][races.races[j]]).."]"
                                        x = x + 2
                                end
                        end
                        y = y + 2
                end
        end
        formspec = formspec.."button_exit[0,11;2,1;exit_button;Proceed]"

        minetest.show_formspec(player, "ally_settings", formspec)
end

races.change_ally_settings = function(fields)
        local race1, race2, field_name = nil, nil, nil
        for i = 1, 5, 1 do
                for j = 1, 5, 1 do
                        race1 = races.races[i]
                        race2 = races.races[j]
                        field_name = race1.."_"..race2
                        if fields[field_name] == "true" then
                                races.allies[race1][race2] = true
                        elseif fields[field_name] == "false" then
                                races.allies[race1][race2] = false
                        end
                end
        end
        races.save_allies()
end

minetest.register_on_player_receive_fields(
        function(player, formname, fields)
                if formname == "ally_settings" then
                        races.change_ally_settings(fields)
                end
        end
)

races.save_allies = function()
        minetest.mkdir(minetest.get_worldpath().."/"..SAVEDIR)
	local file = io.open(minetest.get_worldpath().."/"..SAVEDIR.."/allies.txt", "w")
	if (file) then
		file:write(minetest.serialize(races.allies))
		file:close()
	end
end
