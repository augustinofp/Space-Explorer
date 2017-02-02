--randomizing Objects
local planet = require("scripts.planet_class")
local data = require("scripts.data_storage")
local galaxy = require("scripts.galaxy_class")



local load_galaxy = {}

--atmosphere

math.randomseed( os.time() )
math.random(); math.random(); math.random()

--INITAL TESTING CODE, NOT FINALIZED

function load_galaxy.load(gal_ID, uni_ID, s_start, init)

	
	
	local key = math.random(3, 5)


	return galaxy.new(key, s_start, gal_ID, uni_ID, init)
	--print(key, "/t", data.planets[P_ID]:get_sysID())

end




return load_galaxy
