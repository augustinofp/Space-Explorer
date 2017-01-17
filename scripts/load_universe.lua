--randomizing Objects

local data = require("scripts.data_storage")
local universe = require("scripts.universe_class")



local load_universe = {}

--atmosphere

math.randomseed( os.time() )
math.random(); math.random(); math.random()

--INITAL TESTING CODE, NOT FINALIZED

function load_universe.load(uni_ID, multi_ID, g_start, init)

	
	
	local key = math.random(3, 5)

	load_universe.image = {"Images/universe.png"}

	load_universe.image_ss = {"Images/universe_ss.png"}


	return universe.new(load_universe.image[1], load_universe.image_ss[1], key, g_start, uni_ID, multi_ID, init)
	--print(key, "/t", data.planets[P_ID]:get_sysID())

end




return load_universe
