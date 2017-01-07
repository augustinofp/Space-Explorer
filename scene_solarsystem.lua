--scene_solarsystem.lua
local Planet_class = require("Planet_class")
local master = require("master_storage")
local composer = require( "composer" )
local scene = composer.newScene()
local widget = require "widget"
widget.setTheme("widget_theme_ios7")
local physics = require "physics"
physics.start()
physics.setGravity(0,0)



-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- local forward references should go here

--assign local references to the object tables in master storage

local universe = master.get_universe()
local solar_sys = master.get_sys()
local stars = master.get_stars()
local planets = master.get_planets()

--initialize ID local references
local sys_ID = 0
local star_ID = 0
local P_ID = 0

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local function goto_planet(event)
    local options = {effect = "slideLeft", params = {P_ID}}
    if(event.phase == "ended") then 
        composer.gotoScene("scene_planet", options)
    end
    return true
end


-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --assign appropriate system, and star ID
    sys_ID = planets[event.params.P_ID].get_sysID()
    star_ID = sys_ID

    display.setDefault( "isAnchorClamped", false )
    
    --Display the Appropriate star image/button
    star = display.newImageRect(sceneGroup, stars[star_ID].get_image() , 100, 100)
    star.x =  display.contentCenterX ; star.y = display.contentCenterY;

    local circle = display.newCircle (sceneGroup, 100,100,200)
    circle:setFillColor(0,0,0,0) --This will set the fill color to transparent
    circle.strokeWidth = 3 --This is the width of the outline of the circle
    circle.x = display.contentCenterX; circle.y = display.contentCenterY
    circle:setStrokeColor(1,1,1) --This is the color of the outline


    --assign the max value of for loop to be the total number of planets in the current solar system
    local max = solar_sys.get_planet_number()
    local ring_x = 200
    local ring_y = 200
    local anchor = -6.0
    --for each planet in the current solar system: create a ring, and a corresponding revolving planet image/button
    for i = 1,max do

        --create rings
        local solar_ring = display.newImageRect(sceneGroup, "images/solar_ring.png", ring_x, ring_y)
        solar_ring.x = display.contentCenterX; solar_ring.y = display.contentCenterY
        solar_ring.x = display.contentCenterX; solar_ring.y = display.contentCenterY
        ring_x = ring_x + 100
        ring_y = ring_x


        --create  planet images
        local planet_ss = widget.newButton{
            defaultFile = planets[i].get_ssimage()
        }

        sceneGroup:insert(planet_ss)
        planet_ss.anchorX = anchor

        --these conditional statements used to limit range of speed of planet revolution
        if anchor <= -2.0 then
            anchor = -6.0

        else
            anchor = anchor - 2
        end

        --display revolving planet images, on the event that a planet button is touched, 
        --call the appropriate planet even handler

        planet_ss.x = display.contentCenterX; planet_ss.y = display.contentCenterY
        transition.to( planet_ss, { time=40000, rotation=-360, iterations=0 } ) 
        P_ID = i
        planet_ss:addEventListener("touch", goto_planet)
        
    end 




    -- Background Transition

    display.setDefault("textureWrapX", "mirroredRepeat")

    local background = display.newRect(display.contentCenterX, display.contentCenterY, 2220, 1380)
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

