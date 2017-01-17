local planet = require("planet_class")
local blackhole = require("blackhole_class")
local data = require("data_storage")



local load_blackhole = {}

--atmosphere

math.randomseed( os.time() )
math.random(); math.random(); math.random()

--INITAL TESTING CODE, NOT FINALIZED

function load_blackhole.load(gal_ID)

	
	local key = math.random(2)


	load_blackhole.images  = {"Images/blackhole1.png", "Images/blackhole2.png"}

	load_blackhole.images_ss  = {"Images/blackhole1_ss.png","Images/blackhole2_ss.png"} 


	return blackhole.new(load_blackhole.images[key], gal_ID, load_blackhole.images_ss[key])
	--print(key, "/t", data.planets[P_ID]:get_sysID())

end




return load_blackhole
