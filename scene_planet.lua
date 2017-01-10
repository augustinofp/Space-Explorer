local composer = require( "composer" )
local loadsave = require("loadsave")
local planet = require("Planet_class")
local system = require("solar_sys_class")
local data = require("data_storage")
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

local universe = data.universe
local solar_sys = data.solar_sys
local planets = data.planets
local P_ID = 0
local sys_ID = 0
local params = data.params


--initialize ID local references




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local function goto_solarsystem(event)

    P_ID = params.P_ID
    sys_ID = planets[P_ID]:get_sysID()

    params.sys_ID = sys_ID

    
    if(event.phase == "ended") then 
        composer.gotoScene("scene_solarsystem", "slideLeft")
    end

    return true
end

local function goto_menu(event)
    
    if(event.phase == "ended") then
        --find a way to save information
        composer.gotoScene("scene_menu", "slideRight")
    end

    return true
end

local button_left
local button_right
local background
local planet
-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    planet = display.newImageRect( "Images/planet_1.png", 900, 1300 )
    
    planet.x = 330 ; planet.y = 600
    

    
   
    

    

    button_left = widget.newButton { 
        width = 200,
        height = 70, 
        defaultFile = "images/left_arrow.png",
        overFile = "images/left_arrow_overfile.png",
        
    }

    button_right = widget.newButton { 
        width = 200,
        height = 70, 
        defaultFile = "images/right_arrow.png",
        overFile = "images/right_arrow_overfile.png",
        
    }

    sceneGroup:insert(button_left)
    sceneGroup:insert(button_right)

    button_left.x = display.contentCenterX - 200; button_left.y = display.contentCenterY - 400

    
    button_right.x = display.contentCenterX + 200; button_right.y = display.contentCenterY - 400



    
    button_left:addEventListener("touch", goto_solarsystem)
    button_right:addEventListener("touch", goto_menu)




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

          button_left:removeSelf( )
        button_right:removeSelf( )
        background:removeSelf( )
        planet:removeSelf( )
       
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

