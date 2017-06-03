--randomizing Objects
local planet = require("scripts.planet_class")
--local data = require("scripts.data_storage")
local solar_sys = require("scripts.solar_sys_class")



local load_system = {}

--atmosphere

math.randomseed( os.time() )
math.random(); math.random(); math.random()

--INITAL TESTING CODE, NOT FINALIZED

function load_system.load(sys_ID, gal_ID, p_start, init)

	
	
	local key = math.random(3, 5)


	return solar_sys.new(key, p_start, sys_ID, gal_ID, init)
	--print(key, "/t", data.planets[P_ID]:get_sysID())

end




return load_system
