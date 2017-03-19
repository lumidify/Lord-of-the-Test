minetest.register_craft({
	output = 'lottdecor:bone',
	recipe = {{'lottcore:grave'}},
})

minetest.register_craft({
	output = 'lottdecor:bonedust 5',
	recipe = {{'lottdecor:bone'}},
})

minetest.register_craft({
	output = 'lottdecor:skeleton',
	recipe = {
		{'lottdecor:bone', 'lottdecor:bone', 'lottdecor:bone'},
		{'lottdecor:bone', 'lottdecor:bone', 'lottdecor:bone'},
		{'lottdecor:bone', 'lottdecor:bone', 'lottdecor:bone'},
	}
})