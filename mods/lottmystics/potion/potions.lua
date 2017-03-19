potion = {}

dofile(minetest.get_modpath("lottmystics").."/potion/cauldron.lua")

potion = {
	players = {},
	deaths = {},
	effects = {
		phys_override = function(sname, name, fname, time, sdata, flags)
			local def = {
				on_use = function(itemstack, user, pointed_thing)
					potion.grant(time, user:get_player_name(), fname.."_"..flags.type..sdata.type, name, flags)
					itemstack:take_item()
					return itemstack
				end,
				potion = {
					speed = 0,
					jump = 0,
					gravity = 0,
					air = 0,
					hp = 0,
					alive = 1,
				},
			}
			return def
		end,
		fixhp = function(sname, name, fname, time, sdata, flags)
			local def = {
				on_use = function(itemstack, user, pointed_thing)
					local hp_change = sdata.hp or 3
					if flags.inv == true then
						hp_change = -hp_change
					end
					local h = potion.players[user:get_player_name()].hp
					potion.players[user:get_player_name()].hp = h + hp_change
					minetest.after(sdata.time, function()
						if user ~= nil then
							h = potion.players[user:get_player_name()].hp
							potion.players[user:get_player_name()].hp = h - hp_change
						end
					end)
					itemstack:take_item()
					return itemstack
				end,
			}
			def.mobs = {
				on_near = def.on_use,
			}
			return def
		end,
		air = function(sname, name, fname, time, sdata, flags)
			local def = {
				on_use = function(itemstack, user, pointed_thing)
					local br_change = sdata.br or 3
					if flags.inv == true then
						br_change = -br_change
					end
					local b = potion.players[user:get_player_name()].air
					potion.players[user:get_player_name()].air = br_change

					minetest.after(sdata.time, function()
						if user ~= nil then
							b = potion.players[user:get_player_name()].air
							potion.players[user:get_player_name()].air = b - br_change
						end
					end)
					itemstack:take_item()
					return itemstack
				end,
			}
			return def
		end,
	},
	grant = function(time, playername, potion_name, type, flags)
		local rootdef = minetest.registered_items[potion_name]
		if rootdef == nil then
			return
		end
		if rootdef.potion == nil then
			return
		end
		local def = {}
		for name, val in pairs(rootdef.potion) do
			def[name] = val
		end
		if flags.inv==true then
			def.gravity = 0 - def.gravity
			def.speed = 0 - def.speed
			def.jump = 0 - def.jump
		end
		potion.addPrefs(playername, def.speed, def.jump, def.gravity)
		potion.refresh(playername)
		local deaths = potion.deaths or 0
		minetest.chat_send_player(playername, "You are under the effects of the "..type.." potion.")
		minetest.after(time, function()
			local new_deaths = potion.deaths or 0
			if new_deaths == deaths then
				potion.addPrefs(playername, 0-def.speed, 0-def.jump, 0-def.gravity)
				potion.refresh(playername)
				minetest.chat_send_player(playername, "The effects of the "..type.." potion have worn off.")
			end
		end)
	end,
	addPrefs = function(playername, speed, jump, gravity)
		local prefs = potion.players[playername]
		prefs.speed = prefs.speed + speed
		prefs.jump = prefs.jump + jump
		prefs.gravity = prefs.gravity + gravity
	end,
	refresh = function(playername)
		if minetest.get_player_by_name(playername)~=nil then
			local prefs = potion.players[playername]
			minetest.get_player_by_name(playername):set_physics_override(prefs.speed, prefs.jump, prefs.gravity)
		end
	end,
	register_potion = function(sname, name, fname, time, def)
		local tps = {"power", "corruption"}
		for t=1, #tps do
			for i=1, #def.types do
				local sdata = def.types[i]
				local item_def = {
					description = name .. "\nStrength: " .. tps[t]:gsub("^%l", string.upper)
						.. " " .. sdata.type,
					inventory_image = "potion_bottle.png^potion_"..
						(def.texture or sname)..".png^potion_"..
						tps[t]..sdata.type..".png",
					drawtype = "plantlike",
					paramtype = "light",
					walkable = false,
					groups = {dig_immediate=3,attached_node=1,vessel=1},
                         sounds = default.node_sound_glass_defaults(),
				}
				item_def.tiles = {item_def.inventory_image}
				local flags = {
					inv = false,
					type = tps[t],
				}
				if t == 2 then
					flags.inv = true
				end
				for name, val in pairs(potion.effects[def.effect](sname, name, fname, time, sdata, flags)) do
					item_def[name] = val
				end
				for name, val in pairs(sdata.set) do
					item_def[name] = val
				end
				for name, val in pairs(sdata.effects) do
					item_def.potion[name] = val
				end
                    minetest.register_node(fname.."_"..tps[t]..sdata.type, item_def)
				--potions.register_liquid(i..tps[t]..sname, name.." ("..tps[t].." "..i..")", item_def.on_use)
				if minetest.get_modpath("lottgear")~=nil then
					potion.register_arrow(
						fname.."_"..tps[t]..sdata.type,
						i..tps[t]..sname,
						name.." ("..tps[t].." "..i..")",
						item_def.on_use,
						item_def.description,
						item_def.inventory_image
					)
				end
			end
		end
	end,
}
dofile(minetest.get_modpath("lottmystics").."/potion/arrows.lua")

local time = 0
minetest.register_globalstep(function(dtime)
	time = time + dtime
	if time > 1 then
		time = 0
		for _, player in pairs(minetest.get_connected_players()) do
			local name = player:get_player_name()
			local hp_change = potion.players[name].hp
			if hp_change ~= 0 then
				local hp = player:get_hp()
				hp = hp + hp_change
				hp = math.min(20, hp)
				hp = math.max(0, hp)
				player:set_hp(hp)
			end
			local br_change = potion.players[name].air
			if br_change ~= 0 then
				local br = player:get_breath()
				br = br + br_change
				br = math.min(20, br)
				br = math.max(0, br)
				player:set_breath(br)
			end
			if potion.players[name].alive ~= 1 then
				potion.players[name].alive = 1
			end
		end
	end
end)

minetest.register_on_dieplayer(function(player)
	local name = player:get_player_name()
	potion.players[name] = {
		speed = 1,
		jump = 1,
		gravity = 1,
		air = 0,
		hp = 0,
		alive = 0,
	}
	potion.refresh(name)
	if potion.deaths[name] == nil then
		potion.deaths[name] = 1
	end
	potion.deaths[name] = potion.deaths[name] + 1
end)

potion.register_potion("athelasbrew", "Athelas Brew", "lottmystics:athelasbrew", 100, {
	effect = "fixhp",
	types = {
		{
			type = 1,
               hp = 1,
               time = 20,
			set = {},
			effects = {
			},
		},
		{
			type = 2,
               hp = 2,
               time = 50,
			set = {},
			effects = {
			},
		},
		{
			type = 3,
               hp = 4,
               time = 100,
			set = {},
			effects = {
			},
		},
	}
})

potion.register_potion("limpe", "Limpe", "lottmystics:limpe", 240, {
	effect = "air",
	types = {
		{
			type = 1,
			br = 2,
               hp = 10,
               time = 60,
			set = {},
			effects = {
			},
		},
		{
			type = 2,
			br = 5,
               time = 120,
			set = {},
			effects = {
			},
		},
		{
			type = 3,
			br = 10,
               time = 240,
			set = {},
			effects = {
			},
		},
	}
})

potion.register_potion("miruvor", "Miruvor", "lottmystics:miruvor", 240, {
	effect = "phys_override",
	types = {
		{
			type = 1,
			set = {},
			time = 60,
			effects = {
				jump = 0.3,
			},
		},
		{
			type = 2,
			set = {},
			time = 120,
			effects = {
				jump = 0.6,
			},
		},
		{
			type = 3,
			set = {},
			time = 240,
			effects = {
				jump = 1.0,
			},
		},
	}
})

potion.register_potion("spiderpoison", "Spider Poison", "lottmystics:spiderpoison", 20, {
	effect = "phys_override",
	types = {
		{
			type = 1,
			set = {},
			effects = {
                    speed = -0.2,
                    jump = -0.2,
			},
		},
		{
			type = 2,
			set = {},
			effects = {
                    speed = -0.5,
                    jump = -0.5,
			},
		},
		{
			type = 3,
			set = {},
			effects = {
                    speed = -1,
                    jump = -1,
			},
		},
	}
})

potion.register_potion("orcdraught", "Orc Draught", "lottmystics:orcdraught", 100, {
	effect = "fixhp",
	types = {
		{
			type = 1,
               hp = -1,
               time = 20,
			set = {},
			effects = {
			},
		},
		{
			type = 2,
               hp = -1,
               time = 50,
			set = {},
			effects = {
			},
		},
		{
			type = 3,
               hp = -1,
               time = 100,
			set = {},
			effects = {
			},
		},
	}
})

potion.register_potion("entdraught", "Ent Draught", "lottmystics:entdraught", 240, {
	effect = "phys_override",
	types = {
		{
			type = 1,
			set = {},
			effects = {
                    speed = 1,
                    jump = -0.2,
			},
		},
		{
			type = 2,
			set = {},
			effects = {
                    speed = 2,
                    jump = -0.5,
			},
		},
		{
			type = 3,
			set = {},
			effects = {
                    speed = 3,
                    jump = -1,
			},
		},
	}
})

minetest.register_on_joinplayer(function(player)
	potion.players[player:get_player_name()] = {
		speed = 1,
		jump = 1,
		gravity = 1,
		air = 0,
		hp = 0,
		alive = 1,
	}
end)

minetest.register_on_leaveplayer(function(player)
	potion.players[player:get_player_name()] = nil
	potion.deaths[player:get_player_name()] = nil
end)

minetest.register_chatcommand("effect", {
	params = "none",
	description = "get effect info",
	func = function(name, param)
		minetest.chat_send_player(name, "effects:")
		local potion_e = potion.players[name]
		if potion_e~=nil then
			for potion_name, val in pairs(potion_e) do
				if potion_name ~= "alive" then
					minetest.chat_send_player(name, potion_name .. "=" .. val)
				end
			end
		end
	end,
})

minetest.register_craftitem( "lottmystics:wine", {
	description = "Wine",
	inventory_image = "potion_wine.png",
	wield_image = "potion_wine.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craftitem( "lottmystics:beer", {
	description = "Beer",
	inventory_image = "potion_beer.png",
	wield_image = "potion_beer.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craftitem( "lottmystics:ale", {
	description = "Ale",
	inventory_image = "potion_ale.png",
	wield_image = "potion_ale.png",
	on_use = minetest.item_eat(5),
})

minetest.register_craftitem( "lottmystics:mead", {
	description = "Mead",
	inventory_image = "potion_mead.png",
	wield_image = "potion_mead.png",
	on_use = minetest.item_eat(5),
})

minetest.register_craftitem( "lottmystics:cider", {
	description = "Cider",
	inventory_image = "potion_cider.png",
	wield_image = "potion_cider.png",
	on_use = minetest.item_eat(4),
})

function potion.can_dig(pos, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if not inv:is_empty("src") or not inv:is_empty("dst") or not inv:is_empty("fuel") or
	   not inv:is_empty("upgrade1") or not inv:is_empty("upgrade2") then
		minetest.chat_send_player(player:get_player_name(),
			"Brewer cannot be removed because it is not empty")
		return false
	else
		return true
	end
end

function potion.swap_node(pos, name)
	local node = minetest.get_node(pos)
	if node.name ~= name then
		node.name = name
		minetest.swap_node(pos, node)
	end
	return node.name
end

dofile(minetest.get_modpath("lottmystics").."/potion/potionbrewing.lua")
dofile(minetest.get_modpath("lottmystics").."/potion/brewing.lua")
