-- Farming

lottcrafting.register_craft("shapeless", "mill", {
        inputs = {"farming:wheat_seed"},
        outputs = {"farming:flour"},
})

lottcrafting.register_craft("shapeless", "mill", {
        inputs = {"farming:barley_seed"},
        outputs = {"farming:flour"},
})

lottcrafting.register_craft("shapeless", "mill", {
        inputs = {"farming:corn"},
        outputs = {"farming:flour"},
})

lottcrafting.register_craft("shapeless", "spinning_wheel", {
        inputs = {"farming:cotton"},
        outputs = {"farming:yarn"},
})

lottcrafting.register_craft("shapeless", "loom", {
        inputs = {"farming:yarn"},
        outputs = {"wool:white"},
})

lottcrafting.register_craft("shapeless", "threshing_floor", {
	inputs = {"farming:wheat"},
	outputs = {"farming:wheat_seed", "farming:straw"},
})

lottcrafting.register_craft("shapeless", "threshing_floor", {
	inputs = {"lottfarming:barley"},
	outputs = {"lottfarming:barley_seed", "farming:straw"},
})
