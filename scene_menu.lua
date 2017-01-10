local composer = require( "composer" )
local planet = require("planet_class")
local data = require("data_storage")
local solar = require("solar_sys_class")
local star = require("star_class")
local widget = require "widget"
widget.setTheme("widget_theme_ios7")


-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- local forward references should go here

local scene = composer.newScene()
local btn_play, btn_upgrades, btn_sounds, btn_howtoplay
local P_ID = 0

local planets = data.planets
local params = data.params
local stars = data.stars
local solar_sys = data.solar_sys

--CREATE NECESSARY PLANET, STAR, AND SOLAR SYSTEM OBJECTS
for i = 1,4 do
    planets[i] = planet.new("Images/planet_1.png",i,1,"Images/planet_1_ss.png")
end

solar_sys[1] = solar.new(4, 1)
data.stars[1] = star.new("Images/sun1.png", 1)
--data.params[1] = stars[1]
--if continue button pressed
    --flag = 1

--if play button pressed
    --flag = 0
--local flag = 0






function onPlayTouch(event)
    if(event.phase == "ended") then 
        P_ID = 1
        params.P_ID = P_ID
        
        composer.gotoScene("scene_planet", "fade")
    end
end

-- local function  onHowtoplayTouch(event)
--     if(event.phase == "ended") then 
--         audio.play(_CLICK)
--         composer.gotoScene("scene_howtoplay", "slideLeft")
--     end
-- end

function onSoundsTouch(event)
    if(event.phase == "ended") then 
        if(user.playsound == true) then 
            -- mute the game
            audio.setVolume(0)
            btn_sounds.alpha = 0.5
            user.playsound = false
        else
            -- unmute the game
            audio.setVolume(1)
            btn_sounds.alpha = 1
            user.playsound = true
        end
        loadsave.saveTable(user, "user.json")
    end
end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

--DEFINE LOCAL REFERENCES TO SCENE DISPLAY OBJECTS
local menuTitle
local planet_menu
local btn_play
local btn_sounds
local asteroid1
local asteroid2
local background
-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --Game Title
    menuTitle = display.newText(sceneGroup, "Space Explorer", 0, 0, "SF Automaton", 70)
    menuTitle.x = 320; menuTitle.y = 200

    planet_menu = display.newImageRect(sceneGroup, "images/planet_1.png", 896, 1344)
    planet_menu.x = 330; planet_menu.y = 550;
    transition.to( planet_menu, { rotation=-365, time=65000, iterations =0 } )

    -- Create some Buttons

    btn_play = widget.newButton { 
        width = 200,
        height = 70, 
        defaultFile = "images/play.png",
        
    }
    btn_play.x = 335
    btn_play.y = 500
    sceneGroup:insert(btn_play)

    btn_play:addEventListener("touch", onPlayTouch)
    -- --if saveddata = true then
    --     btn_continue = widget.newButton { 
    --     width = 200,
    --     height = 70, 
    --     defaultFile = "images/continue.png",
    --     onEvent = onPlayTouch
    -- }
    -- btn_play.x = 335
    -- btn_play.y = 420
    -- sceneGroup:insert(btn_continue)



    -- btn_howtoplay = widget.newButton { 
    --     width = 200,
    --     height = 70, 
    --     defaultFile = "images/btn_howtoplay.png",
    --     onEvent = onHowtoplayTouch
    -- }
    -- btn_howtoplay.x = 335
    -- btn_howtoplay.y = 580
    -- sceneGroup:insert(btn_howtoplay)

    btn_sounds = widget.newButton {
    width = 200,
    height = 70,
    defaultFile = "images/btn_sounds.png",
    overFile = "images/btn_soundoff.png",
    
    }
    btn_sounds.x = 100
    btn_sounds.y = 100
    sceneGroup:insert(btn_sounds)

    btn_sounds:addEventListener("touch", onSoundsTouch)

    -- TRANSITIONS

    -- function asteroidAnimation1()
    --     asteroid1 = display.newImage(sceneGroup, "images/asteroid.png")
    --     asteroid1.x = math.random(-10, 0 ); asteroid1.y = math.random(0, 900);
    --     transition.to (asteroid1, {time = 4000, x = math.random(900, 910), y = math.random(0, 900), onComplete = asteroidAnimation2})
    --     transition.to( asteroid1, { rotation=365, time=5000, iterations =0 } )
    --     display.remove(asteroid2)
    -- end
    -- asteroidAnimation1()

    -- function asteroidAnimation2()
    --     asteroid2 = display.newImage(sceneGroup, "images/asteroid.png")
    --     asteroid2.x = math.random(700, 710); asteroid2.y = math.random(0, 900);
    --     transition.to (asteroid2, {time = 4000, x = math.random(-10, 0), y = math.random(0, 900), onComplete = asteroidAnimation1})
    --     transition.to( asteroid2, { rotation=-365, time=5000, iterations =0 } )
    --     display.remove(asteroid1)
    -- end
    -- asteroidAnimation2() 

    -- Background Transition

    display.setDefault("textureWrapX", "mirroredRepeat")

    background = display.newRect(display.contentCenterX, display.contentCenterY, 2220, 1380)
    background.fill = {type = "image", filename = "images/background.png" }
    background:toBack()

    local function animateBackground()
    transition.to( background.fill, { time=60000, x=1, delta=true, onComplete=animateBackground } )
    end

    animateBackground()


end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
          
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        menuTitle:removeSelf( )
        planet_menu:removeSelf( )
        btn_play:removeSelf( )
        btn_sounds:removeSelf( )
        -- asteroid1:removeSelf( )
        -- asteroid2:removeSelf( )
        background:removeSelf( )   
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view

    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene

