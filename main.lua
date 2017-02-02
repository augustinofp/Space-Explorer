-- INCLUDE COMPOSER
local composer = require( "composer" )
local register = require("scripts.register")
local planet = require("scripts.planet_class")
local star = require("scripts.star_class")
local solar = require("scripts.solar_sys_class")
--local pload = require("load_planet")
local galaxy = require("scripts.galaxy_class")
local loadsave = require("scripts.loadsave")
local json = require("json")
--local data_class = require("scripts.data_storage")
--local local_data = require("scripts.local_data")


--local iolib = require("iolib")
--iolib.wrDocs( "data.json", json.encode( data ) )

-- APP OPTIONS 

-- _APPNAME = "Space Explorer"
-- _FONT = "SF Automaton"
-- _GOLDCOST = 100
-- _SHOWADS = true

-- HIDE STATUS BAR 

display.setStatusBar(display.HiddenStatusBar)




-- if (not data == nil) then
-- --LOAD NECESSARY USER DATA INTO THE MASTER TABLE IN DATA_STORAGE.LUA
-- temp.load_data(data.planets, data.stars, data.solar_sys, data.blackholes, data.galaxy, data.universe, data.multiverse, data.params, data.init_flag)

-- data = temp

-- end




--LOAD UP JSON DATA FILES TO CHECK IF THEY HAS BEEN CREATED 

register.planets = loadsave.loadTable("planets.json", system.DocumentsDirectory)
register.stars = loadsave.loadTable("stars.json", system.DocumentsDirectory)
register.blackholes = loadsave.loadTable("blackholes.json", system.DocumentsDirectory)
register.solar_sys = loadsave.loadTable("solar_sys.json", system.DocumentsDirectory)
register.galaxy = loadsave.loadTable("galaxy.json", system.DocumentsDirectory)
register.universe = loadsave.loadTable("universe.json", system.DocumentsDirectory)
register.multiverse = loadsave.loadTable("multiverse.json", system.DocumentsDirectory)
register.params = loadsave.loadTable("params.json", system.DocumentsDirectory)
print("planets = ", register.planets)
print("params = ", register.params)
--IF JSON DATA FILES ARE NOT CREATED, INITIALIZE THEM

if (register.planets == nil) then
    print("there isnt any planet file, initializing...")
    register.planets = {}

    --SAVE THE DATA TO system.DocumentsDirectory
    loadsave.saveTable( register.planets, "planets.json" , system.DocumentsDirectory)
end

if (register.stars == nil) then
    print("there isnt any star file, initializing...")
    register.stars = {}

    --SAVE THE DATA TO system.DocumentsDirectory
    loadsave.saveTable( register.stars, "stars.json" , system.DocumentsDirectory)
end

if (register.solar_sys == nil) then
    print("there isnt any solar_sys file, initializing...")
    register.solar_sys = {}

    --SAVE THE DATA TO system.DocumentsDirectory
    loadsave.saveTable( register.solar_sys, "solar_sys.json" , system.DocumentsDirectory)
end

if (register.galaxy == nil) then
    print("there isnt any galaxy file, initializing...")
    register.galaxy = {}

    --SAVE THE DATA TO system.DocumentsDirectory
    loadsave.saveTable( register.galaxy, "galaxy.json" , system.DocumentsDirectory)
end

if (register.blackholes == nil) then
    print("there isnt any blackhole file, initializing...")
    register.blackholes = {}

    --SAVE THE DATA TO system.DocumentsDirectory
    loadsave.saveTable( register.blackholes, "blackholes.json" , system.DocumentsDirectory)
end

if (register.universe == nil) then
    print("there isnt any universe file, initializing...")
    register.universe= {}

    --SAVE THE DATA TO system.DocumentsDirectory
    loadsave.saveTable( register.universe, "universe.json" , system.DocumentsDirectory)
end

if (register.multiverse == nil) then
    print("there isnt any multiverse file, initializing...")
    register.multiverse = {}

    --SAVE THE DATA TO system.DocumentsDirectory
    loadsave.saveTable( register.multiverse, "multiverse.json" , system.DocumentsDirectory)
end

if (register.params == nil) then
    print("there isnt any params file, initializing...")
    register.params = {}
    register.params.init_flag = 0

    --Initialize ID: THIS VALUE CHANGES DEPENDING WHICH OBJECT IS CURRENTLY BEING VISITED OR USED 
    register.params.P_ID = 0
    register.params.P_save = 0
    register.params.sys_ID = 0
    register.params.star_ID = 0
    register.params.gal_ID = 0
    register.params.hole_ID = 0
    register.params.uni_ID = 0
    register.params.multi_ID = 0

    --Initialize mark: THIS REPRESENTS THE INDEX OF THE NEXT SPOT FOR INSERTION IN THE EVENT THAT AN OBJECT MUST BE CREATED
    register.params.planet_mark = 1
    register.params.system_mark = 1
    register.params.star_mark = 1
    register.params.galaxy_mark = 1
    register.params.hole_mark = 1
    register.params.universe_mark = 1
    register.params.multi_mark = 1

    --SAVE THE DATA TO system.DocumentsDirectory
    loadsave.saveTable( register.params, "params.json" , system.DocumentsDirectory)

end























    -- local params = register[1]:gparams()
    -- params.P_ID = 0
    -- params.sys_ID = 0
    -- params.star_ID = 0
    -- params.gal_ID = 0
    -- params.hole_ID = 0
    -- params.uni_ID = 0
    -- params.multi_ID = 0

    -- --Initialize the next empty index for object creating as the first element in tables
    -- register[1]:gparams().planet_mark = 1
    -- register[1]:gparams().system_mark = 1
    -- register[1]:gparams().star_mark = 1
    -- register[1]:gparams().galaxy_mark = 1
    -- register[1]:gparams().hole_mark = 1
    -- register[1]:gparams().universe_mark = 1
    -- register[1]:gparams().multi_mark = 1

    -- --SAVE THE DATA TO system.DocumentsDirectory
    -- loadsave.saveTable( register[1], "master.json" , system.DocumentsDirectory)



-- else
--     print("begin to load file")
--     --create temporary data file for user info
--     register[1] = data_class.new(data, true)

-- end




-- CONSTANT VALUES

-- _CX = display.contentCenterX
-- _CY = display.contentCenterY + 90
-- _CW = display.contentWidth
-- _CH = display.contentHeight
-- _T = display.screenOriginY -- Top
-- _L = display.screenOriginX -- Left
-- _R = display.viewableContentWidth - _L -- Right
-- _B = display.viewableContentHeight - _T -- Bottom

-- INCLUDE LOAD/ SAVE LIBRARY FROM CORONAROB 

-- local loadsave = require("loadsave")


-- --LOAD UP SOME AUDIO

-- local soundTable = {

--     chimeSound = audio.loadSound( "audio/reverie.mp3" ),
--     bellSound = audio.loadSound( "audio/yoga_spirit.mp3" ),
--     buzzSound = audio.loadSound( "audio/ES_Lonely Space Rhodes 5 - Jonas Elander.mp3" ),
--     clickSound = audio.loadSound( "click.aac" )
-- }

-- audio.play( soundTable["chimeSound"] )

-- -- SET UP SAVED FILE FOR OUR USER

-- user = loadsave.loadTable("user.json")
-- if(user == nil ) then 
-- 	user ={}
-- 	user.level = 100
-- 	user.gold = 100
-- 	user.resource = 100
-- 	user.energy = 100
-- 	user.explorer = 1
-- 	user.playsound = true
-- 	loadsave.saveTable(user, "user.json")
-- end

------------------------------------------------------------------------------------------------------
--TEST PLAN: when game is launched, make a read call to the data file, if this file is empty, then we initiliaze the marks


-- local path = system.pathForFile( "data.txt", system.DocumentsDirectory )
  
-- -- io.open opens a file at path. returns nil if no file found
-- local fh, reason = io.open( path, "r" )
  
-- if fh then
--     -- read all contents of file into a string
--     local contents = fh:read( "*a" )
--     print( "Contents of " .. path .. "\n" .. contents )

-- else
--     print( "Reason open failed: " .. reason )  -- display failure message in terminal
 
--     -- create file because it doesn't exist yet
--     fh = io.open( path, "w" )
 
--     if fh then
--         print( "Created file" )
--     else
--         print( "Create file failed!" )
--     end
 
--     local numbers = {1,2,3,4,5,6,7,8,9}
--     fh:write( "Feed me data!\n", numbers[1], numbers[2], "\n" )
 
--     for _,v in ipairs( numbers ) do
--         fh:write( v, " " )
--     end
 
--     fh:write( "\nNo more data\n" )
-- end
  
-- io.close( fh )


composer.gotoScene( "scripts.scene_menu", {effect = "fade", time = 500})


--Augustino, December 22, 2016
--initial code structure for Event Listener: GOES AT VERY END OF MAIN.LUA

function onSystemEvent( event )
	   if event.type == "applicationStart" then
  	--do start Code ie stuff we need to begin the game
    --launch main.lua

      
    elseif event.type == "applicationExit" then

  	--this block executes just prior the app quitting
    --OS closes least recently used app, the user explicitly quits etc.


    --SAVE USERS DATA

    --loadsave.saveTable( register[1], "master.json" )
    
  
    
    elseif event.type == "applicationSuspend" then
    
    	--this block executed when app goes into "suspend" state
      --user receives phone call, presses home button etc.
      
    elseif event.type == "applicationResume" then
      --this block executes when app resumes from "suspend"
      --user goes back into app (while still running in bg)
      
    end
end


  
  Runtime:addEventListener( "system", onSystemEvent )