--randomizing Objects
local planet = require("Planet_class")
local data = require("data_storage")
local solar_sys = require("solar_sys_class")



local load_system = {}

--atmosphere

math.randomseed( os.time() )
math.random(); math.random(); math.random()

--INITAL TESTING CODE, NOT FINALIZED

function load_system.load(sys_ID, gal_ID, p_start)

	
	
	local key = math.random(3, 8)


	return solar_sys.new(key, p_start, gal_ID)
	--print(key, "/t", data.planets[P_ID]:get_sysID())

end




return load_system
