function flora_oaktree(pos)
	local t = 10 + math.random(3) -- trunk height
	for i = -2, 2 do
	for k = -2, 2 do
		local absi = math.abs(i)
		local absk = math.abs(k)
		if absi >= absk then
			j = t - absi
		else
			j = t - absk
		end
		if math.random() > (absi + absk) / 24 then
			check_add_node({x=pos.x+i,y=pos.y+j+3,z=pos.z+k},{name="lottflora:firleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j+1,z=pos.z+k},{name="lottflora:firleaf"})
			check_add_node({x=pos.x+i+1,y=pos.y+j-1,z=pos.z+k},{name="lottflora:firleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-2,z=pos.z+k+1},{name="lottflora:firleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-3,z=pos.z+k},{name="lottflora:firleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-4,z=pos.z+k},{name="lottflora:firleaf"})
			check_add_node({x=pos.x+i,y=pos.y+j-5,z=pos.z+k},{name="lottflora:firleaf"})
		end
	end
	end
	for j = -5, t do
		check_add_node({x=pos.x,y=pos.y+j,z=pos.z},{name="lottflora:pinetree"})
	end
end