local composer = require( "composer" )
local loadsave = require("loadsave")
local planet = require("Planet_class")
local solar = require("solar_sys_class")
local data = require("data_storage")
local widget = require ("widget")
local physics = require ("physics")
local star = require("star_class")


local scene = composer.newScene()
composer.removeHidden()

local universe = data.universe
local solar_sys = data.solar_sys
local planets = data.planets
local P_ID = 0
local sys_ID = 0
local params = data.params
local stars = data.stars


-- if params.menu == 1 then
--     composer.removeScene("scene_menu")
--     params.menu = 0
-- end

-- if params.sys_ID ~= 0 then
--     composer.removeScene("solar_system")
-- end

widget.setTheme("widget_theme_ios7")


physics.start()
physics.setGravity(0,0)



-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- local forward references should go here


--assign local references to the object tables in master storage



--initialize ID local references




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

function goto_solarsystem(event)

    --update params table
   
    params.sys_ID = data.planets[params.P_ID]:get_sysID()
    params.star_ID = data.planets[params.P_ID]:get_sysID()

    

    
    if(event.phase == "ended") then 
        
        composer.gotoScene("scene_solarsystem", "slideLeft")
    end

    return true
end

function goto_menu(event)
    
    if(event.phase == "ended") then
        --find a way to save information
        
        composer.gotoScene("scene_menu", "fade")

    end

    return true
end

--CREATE LOCAL REFERENCES TO SCENE DISPLAY OBJECTS
local button_left
local button_right
local background
local current_planet
-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    print(params.P_ID)
    current_planet = display.newImageRect( sceneGroup,data.planets[params.P_ID]:get_image(), 600, 600 )
    
    current_planet.x = 330 ; current_planet.y = 550
    transition.to( current_planet, { rotation=-365, time=65000, iterations =0 } )
    

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

    background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, 2220, 1380)
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

