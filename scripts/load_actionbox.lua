local actionbox = require("scripts.actionbox_class")
local data = require("scripts.data_storage")



local load_actionbox = {}



math.randomseed( os.time() )
math.random(); math.random(); math.random()

--INITAL TESTING CODE, NOT FINALIZED

function load_actionbox.load(P_ID, actionbox)

	
	 

	load_actionbox.images  = {"Images/area_circle.png"}



	

	print("key = ", key)
	return actionbox.new(load_actionbox.images[1], P_ID )



end




return load_actionbox