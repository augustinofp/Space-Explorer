local composer = require( "composer" )
local loadsave = require("scripts.loadsave")
local planet = require("scripts.Planet_class")
local solar = require("scripts.solar_sys_class")
local data = require("scripts.data_storage")
local widget = require ("widget")
local physics = require ("physics")
local star = require("scripts.star_class")
local pload = require("scripts.load_planet")
local sload = require("scripts.load_system")
local stload = require("scripts.load_star")

local scene = composer.newScene()

local universe = data.universe
local solar_sys = data.solar_sys
local planets = data.planets
local P_ID = 0
local sys_ID = 0
local params = data.params
local stars = data.stars



widget.setTheme("widget_theme_ios7")


physics.start()
physics.setGravity(0,0)

print("P_ID = ", params.P_ID)
print("star_ID = ", params.star_ID)
print("sys_ID = ", params.sys_ID)
print("gal_ID = ", params.gal_ID)
print("hole_ID = ", params.hole_ID)
print("3. planet mark = ", params.planet_mark)



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

  



    
    if(event.phase == "ended") then
        --update params table
        params.sys_ID = data.planets[params.P_ID]:get_sysID()
        params.gal_ID = data.planets[params.P_ID]:get_galID()
        params.star_ID = data.planets[params.P_ID]:get_sysID()
        params.hole_ID = data.planets[params.P_ID]:get_galID()
        -- print("4. sys_ID = ", params.sys_ID, "    4. gal_ID = ", params.gal_ID)
        -- print("4. ", params.sys_ID >= params.system_mark)

        --if the system needs to be created
        if data.solar_sys[params.sys_ID] == nil then 

            data.solar_sys[params.sys_ID] = sload.load(params.sys_ID, params.gal_ID, params.P_ID, true)
            data.stars[params.star_ID] = stload.load(params.sys_ID)
            
            params.star_mark = params.star_mark + 1
            params.system_mark = params.system_mark + 1
            print("4. sys_ID = ", params.sys_ID, "    4. gal_ID = ", params.gal_ID, "    star_ID = ", params.star_ID, "hole_ID = ", params.hole_ID)
            print("4.   star_mark = ", params.star_mark, "    system_mark = ", params.system_mark)
        end 
        composer.removeHidden()
        composer.gotoScene("scripts.scene_solarsystem", "slideLeft")
    end

    return true
end

function goto_menu(event)
    
    if(event.phase == "ended") then
        --find a way to save information
        composer.removeHidden()
        composer.gotoScene("scripts.scene_menu", "fade")

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
    --print(params.P_ID)
    current_planet = display.newImageRect( sceneGroup,data.planets[params.P_ID]:get_image(), 500, 500 )
    
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

