
local planet = require("scripts.planet_class")
local star = require("scripts.star_class")
--local data = require("scripts.data_storage")



local load_star = {}

--atmosphere

math.randomseed( os.time() )
math.random(); math.random(); math.random()

--INITAL TESTING CODE, NOT FINALIZED

function load_star.load(sys_ID)

	
	local key = math.random(2)


	load_star.images  = {"Images/sun.png", "Images/sun1.png"}

	load_star.images_ss  = {"Images/sun_ss.png","Images/sun1_ss.png"} 


	return star.new(load_star.images[key], sys_ID, load_star.images_ss[key])
	--print(key, "/t", data.planets[P_ID]:get_sysID())

end




return load_star

	




























-- 	local toxic_level = {none, low, medium, high, death}

-- 	local toxicity = toxic_level[math.rand(5)]

-- 	--call class method to set toxicity
-- 	Star.set_toxicity(New_Planet, toxicity)

-- 	local ages = {birth, young, middle, old, dying}

-- 	local age = ages[math.rand(5)]

-- 	--call class method to set age
-- 	Star.set_age(New_Planet, age)

-- 	local image = {star1.jpg, star2.jpg, star3.jpg, etc}

-- 	local star_image = image[math.random(3)] --updated as number of stars is increased

-- 	--call class method to set image
-- 	Star.set_image(New_Star, image)

-- 	local habitation = {none, type0, type1, type2, type3}


-- 	-- use some way of ranking the different phases of the game in terms of overall progress
-- 	local game_level = level


-- 	--call class method to set level
-- 	Star.set_level(New_Star, level)
	

-- 	if math.random(2) == 1 then
-- 		local habitat = habitation[0]

-- 	else 

-- 		--call class method to set habitation
-- 		Star.set_habitation(New_Star, level) -- assuming that level indicates your type of civilization: type0, type1, type2, type3	

-- 	end


-- 	--call class method to set level

-- 	Star.set_level(New_Star, level)
	

-- end





