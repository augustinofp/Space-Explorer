--randomizing Objects

local data = require("scripts.data_storage")
local multiverse = require("scripts.multi_class")



local load_multiverse = {}

--atmosphere

math.randomseed( os.time() )
math.random(); math.random(); math.random()

--INITAL TESTING CODE, NOT FINALIZED

function load_multiverse.load( multi_ID, u_start, init)

	
	
	local key = math.random(3, 5)


	return universe.new(key, g_start, uni_ID, multi_ID, init)
	--print(key, "/t", data.planets[P_ID]:get_sysID())

end




return load_universe
