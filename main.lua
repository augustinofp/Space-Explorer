-- INCLUDE COMPOSER
local composer = require( "composer" )
local data = require("data_storage")

--Initialize master data file
data.planets = {}
data.stars = {}
data.solar_sys = {}
data.galaxy = {}
data.universe = {}
data.multiverse = {}
data.params = {}
data.params.P_ID = 0
data.params.sys_ID = 0

-- APP OPTIONS 

_APPNAME = "Space Explorer"
_FONT = "SF Automaton"
_GOLDCOST = 100
_SHOWADS = true

-- HIDE STATUS BAR 

display.setStatusBar(display.HiddenStatusBar)

-- CONSTANT VALUES

_CX = display.contentCenterX
_CY = display.contentCenterY + 90
_CW = display.contentWidth
_CH = display.contentHeight
_T = display.screenOriginY -- Top
_L = display.screenOriginX -- Left
_R = display.viewableContentWidth - _L -- Right
_B = display.viewableContentHeight - _T -- Bottom

-- INCLUDE LOAD/ SAVE LIBRARY FROM CORONAROB 

loadsave = require("loadsave")


-- LOAD UP SOME AUDIO

local soundTable = {

    chimeSound = audio.loadSound( "audio/reverie.mp3" ),
    bellSound = audio.loadSound( "audio/yoga_spirit.mp3" ),
    buzzSound = audio.loadSound( "audio/ES_Lonely Space Rhodes 5 - Jonas Elander.mp3" ),
    clickSound = audio.loadSound( "click.aac" )
}

audio.play( soundTable["chimeSound"] )

-- SET UP SAVED FILE FOR OUR USER

user = loadsave.loadTable("user.json")
if(user == nil ) then 
	user ={}
	user.level = 100
	user.gold = 100
	user.resource = 100
	user.energy = 100
	user.explorer = 1
	user.playsound = true
	loadsave.saveTable(user, "user.json")
end


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