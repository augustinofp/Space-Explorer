-- INCLUDE COMPOSER
local composer = require( "composer" )
local data = require("data_storage")
local planet = require("planet_class")
local star = require("star_class")
local solar = require("solar_sys_class")

--Initialize master data file
data.planets = {}
local planets = data.planets
data.stars = {}
local stars = data.stars
data.solar_sys = {}
local solar_sys = data.solar_sys
data.galaxy = {}
data.universe = {}
data.multiverse = {}
data.params = {}
data.params.P_ID = 0
data.params.sys_ID = 0
data.params.star_ID = 0
data.params.menu = 0

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

--loadsave = require("loadsave")


-- LOAD UP SOME AUDIO

-- local soundTable = {

--     chimeSound = audio.loadSound( "audio/reverie.mp3" ),
--     bellSound = audio.loadSound( "audio/yoga_spirit.mp3" ),
--     buzzSound = audio.loadSound( "audio/ES_Lonely Space Rhodes 5 - Jonas Elander.mp3" ),
--     clickSound = audio.loadSound( "click.aac" )
-- }

-- audio.play( soundTable["chimeSound"] )

-- SET UP SAVED FILE FOR OUR USER

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


--CREATE NECESSARY PLANET, STAR, AND SOLAR SYSTEM OBJECTS
data.planets[1] = planet.new("Images/rainbow_planet.png",1,1,"Images/rainbow_planet_ss.png")

data.planets[2] = planet.new("Images/blue_planet.png",2,1,"Images/blue_planet_ss.png")
data.planets[3] = planet.new("Images/gold_planet.png",3,1,"Images/gold_planet_ss.png")
data.planets[4] = planet.new("Images/dark_planet.png",4,1,"Images/dark_planet_ss.png")



data.solar_sys[1] = solar.new(4, 1)
data.stars[1] = star.new("Images/sun.png", 1)


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