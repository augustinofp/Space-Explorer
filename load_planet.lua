--randomizing Objects
local planet = require("Planet_class")
local data = require("data_storage")



local load_planet = {}

--atmosphere




--INITAL TESTING CODE, NOT FINALIZED

function load_planet.load(P_ID, sys_ID)


	local key = math.random(10)

	load_planet.images  = {"Images/blue_planet.png", "Images/dark_planet.png",
	 "Images/gold_planet.png", "Images/rainbow_planet.png" , 
	 "Images/planet_1.png", "Images/planet_2.png", 
	 "Images/planet_3.png", "Images/hell_planet.png", 
	 "Images/alien_planet.png","Images/earth.png",
	 "Images/cloudy_planet.png"}

	 load_planet.images_ss  = {"Images/blue_planet_ss.png","Images/dark_planet_ss.png",
	 "Images/gold_planet_ss.png","Images/rainbow_planet_ss.png" , 
	 "Images/planet_1_ss.png", "Images/planet_2_ss.png", 
	 "Images/planet_3_ss.png","Images/hell_planet_ss.png", 
	 "Images/alien_planet_ss.png", "Images/earth_ss.png",
	  "Images/cloudy_planet_ss.png"} 


	data.planets[P_ID] = planet.new(load_planet.images[key], P_ID, sys_ID, load_planet.images_ss[key])


	return true

end




return load_planet




























-- local function load_planet(New_Planet, level)

-- 	local atmosphere = {heavy, multi_layer, thin_dusty, thin_tenuous, crystal_clouds}

-- 	local atmos = atmosphere[math.random(5)]

-- 	--call class method to set atmosphere
-- 	Planet.set_atmos(New_Planet, atmos)

-- 	local inside = {earth_like, gas, lava, hollow}

-- 	local in_mat = inside[math.random(4)]

-- 	--call class method to set inside material
-- 	Planet.set_in_mat(New_Planet, in_mat)

-- 	local outside = {rocky, liquid, gas, ice}

-- 	local out_mat = outside[math.random(4)]

-- 	--call class method to set outside material
-- 	Planet.set_out_mat(New_Planet, out_mat)

-- 	local toxic_level = {none, low, medium, high, death}

-- 	local toxicity = toxic_level[math.rand(5)]

-- 	--call class method to set toxicity
-- 	Planet.set_toxicity(New_Planet, toxicity)

-- 	local ages = {birth, young, middle, old, dying}

-- 	local age = ages[math.rand(5)]

-- 	--call class method to set age
-- 	Planet.set_age(New_Planet, age)

-- 	local image = {planet1.jpg, planet2.jpg, planet3.jpg, etc}

-- 	local planet_image = image[math.random(3)] --updated as number of planets is increased

-- 	--call class method to set image
-- 	Planet.set_image(New_Planet, image)

-- 	local habitation = {none, type0, type1, type2, type3}

-- 	--call class method to set level
-- 	PLanet.set_level(New_Planet, level)
	

-- 	if math.random(2) == 1 then
-- 		local habitat = habitation[0]

-- 	else 

-- 		--call class method to set habitation
-- 		Planet.set_habitation(New_Planet, level) -- assuming that level indicates your type of civilization: type0, type1, type2, type3	

-- 	end


-- 	--call class method to set level

-- 	Planet.set_level(New_Planet, level)




-- end
