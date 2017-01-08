local composer = require( "composer" )
local loadsave = require("loadsave")
local planet = require("Planet_class")
local system = require("Solar_system_class")
local master = require("master_storage")
local widget = require ("widget")
local physics = require ("physics")


local scene = composer.newScene()

widget.setTheme("widget_theme_ios7")


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

local star_ID = 0
local P_ID = event.params.P_ID
local sys_ID = planets[P_ID].get_sysID()

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local function goto_solarsystem(event)
    local options = {effect = "slideLeft", params = {P_ID, sys_ID}}

    if(event.phase == "ended") then 
        composer.gotoScene("scene_solarsystem", options)
    end

    return true
end

local function goto_menu(event)
    
    if(event.phase == "ended") then
        --find a way to save information
        composer.gotoScene("scene_menu")
    end

    return true
end


-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    local planet = planets[event.params.P_ID]
    sceneGroup:insert(planet)
   

    planet.x = display.contentCenterX; planet.y = display.contentCenterY
    

    
    planet.isVisible = true
    

    

    local button_left = widget.newButton { 
        width = 200,
        height = 70, 
        defaultFile = "images/left_arrow.png",
        overFile = "images/left_arrow_overfile.png",
        
    }

    local button_right = widget.newButton { 
        width = 200,
        height = 70, 
        defaultFile = "images/right_arrow.png",
        overFile = "images/right_arrow_overfile.png",
        
    }

    sceneGroup:insert(button_left)
    sceneGroup:insert(button_right)

    button_left.x = display.contentCenterX; button_left.y = display.contentCenterY

    button_left.isVisible = true
    button_right.x = display.contentCenterX; button_right.y = display.contentCenterY

    button_right.isVisible = true

    
    button_left:addEventListener("touch", goto_solarsystem())
    button_right:addEventListener("touch", goto_menu())




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

    -- Function of Buttons 


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

