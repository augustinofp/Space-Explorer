-- INCLUDE COMPOSER
local composer = require( "composer" )
local data = require("data_storage")
local planet = require("planet_class")
local star = require("star_class")
local solar = require("solar_sys_class")
--local pload = require("load_planet")
local galaxy = require("galaxy_class")

--Initialize master data file
data.planets = {}
data.stars = {}
data.solar_sys = {}
data.galaxy = {}
data.universe = {}
data.multiverse = {}

data.params = {}
data.init_flag = 0

data.params.P_ID = 0
data.params.sys_ID = 0
data.params.star_ID = 0
data.params.gal_ID = 0
data.params.uni_ID = 0
data.params.multi_ID = 1

data.params.planet_mark = 1
data.params.system_mark = 1
data.params.star_mark = 1
data.params.galaxy_mark = 1
data.params.universe_mark = 1
data.params.multi_mark = 1



-- APP OPTIONS 

-- _APPNAME = "Space Explorer"
-- _FONT = "SF Automaton"
-- _GOLDCOST = 100
-- _SHOWADS = true

-- HIDE STATUS BAR 

display.setStatusBar(display.HiddenStatusBar)

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




-- --CREATE NECESSARY PLANET, STAR, AND SOLAR SYSTEM OBJECTS
-- pload.load(1,1)



-- pload.load(2,1)
-- pload.load(3,1)
-- pload.load(4,1)
-- pload.load(5,1)
-- pload.load(6,2)
-- pload.load(7,2)
-- pload.load(8,2)
-- pload.load(9,2)
-- pload.load(10,2)
-- pload.load(11,2)




-- data.solar_sys[1] = solar.new(5, 1)
-- data.solar_sys[2] = solar.new(6, 6)

-- data.stars[1] = star.new("Images/sun.png", 1, "Images/sun_ss.png")
-- data.stars[2] = star.new("Images/sun1.png", 2, "Images/sun1_ss.png")

-- data.galaxy[1] = galaxy.new("Images/galaxy.png", 2, 1)

composer.gotoScene( "scene_menu", {effect = "fade", time = 500})


--Augustino, December 22, 2016
--initial code structure for Event Listener: GOES AT VERY END OF MAIN.LUA

local function onSystemEvent( event )
	if event.type == "applicationStart" then
  	--do start Code ie stuff we need to begin the game
    --launch main.lua
    
    
    
  elseif event.type == "applicationExit" then
  	--this block executes just prior the app quitting
    --OS closes least recently used app, the user explicitly quits etc.
    
  
  
  elseif event.type == "applicationSuspend" then
  
  	--this block executed when app goes into "suspend" state
    --user receives phone call, presses home button etc.
    
  elseif event.type == "applicationResume" then
    --this block executes when app resumes from "suspend"
    --user goes back into app (while still running in bg)
    
  end
  end
  
  Runtime:addEventListener( "system", onSystemEvent )