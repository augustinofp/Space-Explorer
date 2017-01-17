local composer = require( "composer" )
local planet = require("scripts.planet_class")
local data = require("scripts.data_storage")
local solar = require("scripts.solar_sys_class")
local star = require("scripts.star_class")
local widget = require "widget"
widget.setTheme("widget_theme_ios7")
local loadsave = require("scripts.loadsave")


local pload = require("scripts.load_planet")
local planets = data.planets
local params = data.params
local stars = data.stars
local solar_sys = data.solar_sys
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- local forward references should go here

local scene = composer.newScene()


-- if params.P_ID ~= 0 then
--     composer.removeScene("scene_planet")
-- end
-- params.menu = 1

--local P_ID = 0



--data.params[1] = stars[1]
--if continue button pressed
    --flag = 1

--if play button pressed
    --flag = 0
--local flag = 0






function onPlayTouch(event)
    if(event.phase == "ended") then 
        --CREATE OR CALL NECESSARY PLANET, STAR, AND SOLAR SYSTEM OBJECTS
        if params.planet_mark == 1 then -- if no saved planet objects
            data.planets[params.planet_mark] = pload.load(params.planet_mark,params.system_mark, params.galaxy_mark)  
            params.P_ID = 1
            params.star_ID = 1
            params.sys_ID = 1 
            params.gal_ID = 1 
            params.hole_ID = 1
            params.planet_mark = params.planet_mark + 1
            print("3. planet mark = ", params.planet_mark)
        end

        --else 
            --create drop down menu of planets/systems/galaxies/universes to start off at (according to user progress)
        
            --NEED TO CREATE AND IMPLEMENT THIS, NOT POSSIBLE AT THE CURRENT TIME (Jan 14, 2017)

        --end

        
        composer.removeHidden( false )
        composer.gotoScene("scripts.scene_planet", "fade")
    end
end

-- local function  onHowtoplayTouch(event)
--     if(event.phase == "ended") then 
--         audio.play(_CLICK)
--         composer.gotoScene("scene_howtoplay", "slideLeft")
--     end
-- end

-- function onSoundsTouch(event)
--     if(event.phase == "ended") then 
--         if(user.playsound == true) then 
--             -- mute the game
--             audio.setVolume(0)
--             btn_sounds.alpha = 0.5
--             user.playsound = false
--         else
--             -- unmute the game
--             audio.setVolume(1)
--             btn_sounds.alpha = 1
--             user.playsound = true
--         end
--         loadsave.saveTable(user, "user.json")
--     end
-- end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

--DEFINE LOCAL REFERENCES TO SCENE DISPLAY OBJECTS
local menuTitle
local planet_menu
local btn_play
local btn_sounds
-- local asteroid1
-- local asteroid2
local background



--  local asteroid
--  local asteroidX
-- local asteroidY
-- -- local xLeft
-- -- local yUp
-- -- local xRight
-- -- local yDown
-- local i = 0
-- local j = 0
-- create()



function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --Game Title
    menuTitle = display.newText(sceneGroup, "Space Explorer", 0, 0, "SF Automaton", 70)
    menuTitle.x = 320; menuTitle.y = 200
 
    planet_menu = display.newImageRect(sceneGroup, "Images/earth.png", 500, 500)
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

    -- btn_sounds = widget.newButton {
    -- width = 200,
    -- height = 70,
    -- defaultFile = "images/btn_sounds.png",
    -- overFile = "images/btn_soundoff.png",
    
    -- }
    -- btn_sounds.x = 100
    -- btn_sounds.y = 100
    -- sceneGroup:insert(btn_sounds)

    -- btn_sounds:addEventListener("touch", onSoundsTouch)


    

    --Background Transition

    display.setDefault("textureWrapX", "mirroredRepeat")

    background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, 2220, 1380)
    background.fill = {type = "image", filename = "Images/background.png" }
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
          transition.cancel()
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
         
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

