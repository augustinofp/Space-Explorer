local composer = require( "composer" )
local planet = require("scripts.planet_class")
--local data = require("scripts.data_storage")
local solar = require("scripts.solar_sys_class")
local star = require("scripts.star_class")
local widget = require "widget"
widget.setTheme("widget_theme_ios7")
local loadsave = require("scripts.loadsave")
local data = require("scripts.register")


local pload = require("scripts.load_planet")
local planets = data.planets
local params = data.params
local stars = data.stars
local solar_sys = data.solar_sys

print("planets = ", data.planets)
print("params = ", data.params)
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- local forward references should go here

local scene = composer.newScene()






function onPlayTouch(event)

    if(event.phase == "ended") then 
        --CREATE OR CALL NECESSARY PLANET, STAR, AND SOLAR SYSTEM OBJECTS
        print(params.planet_mark)

        if params.planet_mark == 1 then -- if no saved planet objects
            print("no saved planet objects...")
            planets[1] = pload.load(params.planet_mark,params.system_mark, params.galaxy_mark)  
            params.P_ID = 1
            
            params.P_save = 1
            params.star_ID = 1
            params.sys_ID = 1 
            params.gal_ID = 1 
            params.hole_ID = 1
            params.planet_mark = params.planet_mark + 1


            --SAVE THE DATA
            loadsave.saveTable( params, "params.json" , system.DocumentsDirectory)
            loadsave.saveTable( planets, "planets.json" , system.DocumentsDirectory)



            --print("3. planet mark = ", params.planet_mark)
        



        else 
            print("params.P_ID = ", params.P_ID)
            print("params.P_save = ", params.P_save)

            params.P_ID = params.P_save

            --create drop down menu of planets/systems/galaxies/universes to start off at (according to user progress)
        
            --NEED TO CREATE AND IMPLEMENT THIS, NOT POSSIBLE AT THE CURRENT TIME (Jan 14, 2017)

        end
        
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





    local asteroid1
    local asteroid2
    function asteroidAnimation()
           asteroid1 = display.newImage(sceneGroup, "images/asteroid.png")
           asteroid1.x = math.random(-10, -2 ); asteroid1.y = math.random(0, 900);
           transition.to(asteroid1, {time = 4000, x = math.random(900, 910), y = math.random(0, 900), onComplete = function() display.remove(asteroid2) display.remove(asteroid1) end })
           transition.to( asteroid1, { rotation=365, time=5000, iterations =0 } )

           asteroid2 = display.newImage(sceneGroup, "images/asteroid.png")
           asteroid2.x = math.random(900, 910); asteroid2.y = math.random(0, 900);
           transition.to (asteroid2, {time = 4000, x = math.random(-10, -2), y = math.random(0, 900), onComplete = asteroidAnimation})
           transition.to( asteroid2, { rotation=365, time=5000, iterations =0 } )

    end

    asteroidAnimation()


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


--     function openAction_Box( event )
--     local action_box = display.newImage(sceneGroup, "images/action_box.png")
--     action_box.x = display.contentCenterX; action_box.y = display.contentCenterY
--         --display scroll view
   
--     -- ScrollView listener
--     function scrollListener( event )
--         local phase = event.phase
--         if ( phase == "began" ) then print( "Scroll view was touched" )
--         elseif ( phase == "moved" ) then print( "Scroll view was moved" )
--         elseif ( phase == "ended" ) then print( "Scroll view was released" )
--         end
--         -- In the event a scroll limit is reached...
--         if ( event.limitReached ) then
--             if ( event.direction == "up" ) then print( "Reached bottom limit" )
--             elseif ( event.direction == "down" ) then print( "Reached top limit" )
--             elseif ( event.direction == "left" ) then print( "Reached right limit" )
--             elseif ( event.direction == "right" ) then print( "Reached left limit" )
--             end
--         end
--         return true
--     end
--     -- Create the widget
--     scrollView = widget.newScrollView(
--         {
--             top = 215,
--             left = 65,
--             width = 515,
--             height = 600,
--             backgroundColor = { 0.56, 0.56, 0.56 },
--             scrollWidth = 0,
--             scrollHeight = 800,
--             listener = scrollListener
--         }
--     )
--     sceneGroup:insert(scrollView)
--     -- Create a image and insert it into the scroll view
    
--     local explorer_icon = display.newImageRect(sceneGroup, "images/explorer_ico.png", 160, 160)
--     explorer_icon.x = display.contentCenterX - 185; explorer_icon.y = display.contentCenterY + 45
--     scrollView:insert(explorer_icon)

--     -- --local transfer_box = display.newImage(sceneGroup, "images/variable_holder.png")
--     -- transfer_box.x = display.contentCenterX - 90; transfer_box.y = display.contentCenterY + 50
--     -- scrollView:insert(transfer_box)

--     local currentVillagers = display.newText(sceneGroup, "15", 0, 0, "SF Automaton", 40)
--     currentVillagers.x = display.contentCenterX - 90; currentVillagers.y = display.contentCenterY + 50
--     currentVillagers:setFillColor(0, 0, 0)
--     scrollView:insert(currentVillagers)

--     local receive_box = display.newImage(sceneGroup, "images/variable_holder.png")
--     receive_box.x = display.contentCenterX + 100; receive_box.y = display.contentCenterY + 50
--     scrollView:insert(receive_box)

--     local go_box = display.newImage(sceneGroup, "images/transfer_villagers.png")
--     go_box.x = display.contentCenterX + 190; go_box.y = display.contentCenterY + 50
--     scrollView:insert(go_box)

--     local sexy_x = widget.newButton{
--     defaultFile = "images/sexy_x.png",
--     overFile = "images/sexy_x_overfile.png",
--     onEvent = onSexyTouch}

--     sexy_x.x = display.contentCenterX + 235; sexy_x.y = display.contentCenterY - 240
--     sceneGroup:insert(sexy_x)
--     scrollView:insert(sexy_x)   

--     local btn_minus_explorer = widget.newButton{
--     defaultFile = "images/btn_minus.png",
--     overFile = "images/btn_minus_overfile.png",
--     onEvent = onSexyTouch
--     }

--     btn_minus_explorer.x = display.contentCenterX + 5; btn_minus_explorer.y = display.contentCenterY + 80
--     sceneGroup:insert(btn_minus_explorer)
--     btn_minus_explorer.width = 78; 
--     btn_minus_explorer.height = 42
--     scrollView:insert(btn_minus_explorer)

--     local btn_plus_explorer = widget.newButton{
--     defaultFile = "images/btn_plus.png",
--     overFile = "images/btn_plus_overfile.png",
--     onEvent = onSexyTouch
--     }

--     btn_plus_explorer.x = display.contentCenterX + 5; btn_plus_explorer.y = display.contentCenterY + 20 
--     sceneGroup:insert(btn_plus_explorer)
--     btn_plus_explorer.width = 78; 
--     btn_plus_explorer.height = 42
--     scrollView:insert(btn_plus_explorer)

--     local btn_travel = widget.newButton{
--     defaultFile = "images/btn_travel.png",
--     overFile = "images/btn_travel_overfile.png",
--     onEvent = onSexyTouch
--     }

--     btn_travel.x = display.contentCenterX + 100; btn_travel.y = display.contentCenterY - 50
--     sceneGroup:insert(btn_travel)
--     scrollView:insert(btn_travel)

--     local btn_build = widget.newButton{
--     defaultFile = "images/btn_build.png",
--     overFile = "images/btn_build_overfile.png",
--     onEvent = build_Box
--     }

--     btn_build.x = display.contentCenterX + 100; btn_build.y = display.contentCenterY - 150
--     sceneGroup:insert(btn_build)
--     scrollView:insert(btn_build)

 
    
-- end

-- local area_circle = display.newImageRect(sceneGroup, "images/area_circle.png", 100, 100 )
--     area_circle.x = 300; area_circle.y = 700
--     transition.to( area_circle, { rotation=-365, time=5000, iterations =0 } )
 
--     area_circle:addEventListener ( "tap", openAction_Box )


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

