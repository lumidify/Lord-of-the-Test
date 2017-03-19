minetest.register_craft({
	output = 'lottgear:pipe',
	recipe = {
		{'', '', 'group:stick'},
		{'group:wood', 'group:stick', ''},
		{'group:stick', '', ''},
	}
})

pipeweed = {
	{"lottflora:pipeweed_cooked"},
}

minetest.register_tool("lottgear:pipe", {
	description = "Pipe",
	inventory_image = "pipe.png",
     on_use = function(itemstack, player)
     for _,arrow in ipairs(pipeweed) do
          if player:get_inventory():get_stack("main", player:get_wield_index()+1):get_name() == arrow[1] then
               player:set_hp(player:get_hp()+2)
			if not minetest.setting_getbool("creative_mode") then
				player:get_inventory():remove_item("main", arrow[1])
			end
			local pos = player:getpos()
			local dir = player:get_look_dir()
			minetest.add_particle({
   				pos = {x=pos.x,y=pos.y+1.5,z=pos.z},
    			vel = {x=dir.x*.3, y=.2, z=dir.z*.3},
  	 			acc = {x=dir.x*.01, y=.1, z=dir.z*.01},
  		  		expirationtime = 5,
    			size = .75,
    			collisiondetection = false,
    			vertical = false,
    			texture = "pipe_smokering.png",
			})
		end
	end
end})