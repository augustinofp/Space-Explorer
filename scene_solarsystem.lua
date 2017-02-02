 --scene_solarsystem.lua
local planet = require("scripts.planet_class")
local star = require("scripts.star_class")
--local data = require("scripts.data_storage")
local composer = require( "composer" )
local pload = require("scripts.load_planet")
local gload = require("scripts.load_galaxy")
local bhload = require("scripts.load_blackhole")
local loadsave = require("scripts.loadsave")
local data = require("scripts.register")

local scene = composer.newScene()



local widget = require ("widget")
widget.setTheme("widget_theme_ios7")
local physics = require ("physics")
physics.start()
physics.setGravity(0,0)




-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- local forward references should go here

local universe = data.universe
local solar_sys = data.solar_sys
local planets = data.planets
local params = data.params
local stars = data.stars
local galaxy = data.galaxy
local multiverse = data.multiverse
local blackholes = data.blackholes



print("P_ID = ", params.P_ID)
print("star_ID = ", params.star_ID)
print("sys_ID = ", params.sys_ID)
print("gal_ID = ", params.gal_ID)
print("hole_ID = ", params.hole_ID)



--initialize ID local references


local P_ID = {}
local rings = {}
local planet_ss = {}


 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

function goto_planet(event)

    
    if(event.phase == "ended") then 
        params.P_ID = event.target.param
        params.P_save = params.P_ID
        print("5. P_ID = ", params.P_ID ,"  ")
        
        --if planet has not been created, create it
        if event.target.image == "area_circle.png" then
            
            planets[params.P_ID] = pload.load(params.P_ID, params.sys_ID, params.gal_ID)
            params.planet_mark = params.planet_mark + 1

            --SAVE INFORMATION
            loadsave.saveTable(planets, "planets.json" , system.DocumentsDirectory)
            loadsave.saveTable(stars, "stars.json" , system.DocumentsDirectory)
            loadsave.saveTable(solar_sys, "solar_sys.json" , system.DocumentsDirectory)
            loadsave.saveTable(blackholes, "blackholes.json" , system.DocumentsDirectory)
            loadsave.saveTable(galaxy, "galaxy.json" , system.DocumentsDirectory)
            loadsave.saveTable(universe, "universe.json" , system.DocumentsDirectory)
            loadsave.saveTable(multiverse, "multiverse.json" , system.DocumentsDirectory)
            print("5. planet mark = ",  params.planet_mark)
        end

        --SAVE INFORMATION
        loadsave.saveTable(params, "params.json" , system.DocumentsDirectory)
        
        composer.removeHidden()
        composer.gotoScene("scripts.scene_planet", "fade")
    end

    return true
end

function goto_galaxy(event)

    --update params table
    -- params.gal_ID
    -- data.galaxy[]
    print(params.gal_ID)

    if(event.phase == "ended") then
            
            --if the galaxy needs to be created
            if galaxy[params.gal_ID] == nil then 

                galaxy[params.gal_ID] = gload.load(params.gal_ID, params.uni_ID, params.sys_ID, true)
                blackholes[params.hole_ID] = bhload.load(params.gal_ID)
                
                params.hole_mark = params.hole_mark + 1
                params.galaxy_mark = params.galaxy_mark + 1

                --SAVE INFROMATION

                loadsave.saveTable(planets, "planets.json" , system.DocumentsDirectory)
                loadsave.saveTable(stars, "stars.json" , system.DocumentsDirectory)
                loadsave.saveTable(solar_sys, "solar_sys.json" , system.DocumentsDirectory)
                loadsave.saveTable(galaxy, "galaxy.json" , system.DocumentsDirectory)
                loadsave.saveTable(blackholes, "blackholes.json" , system.DocumentsDirectory)
                loadsave.saveTable(universe, "universe.json" , system.DocumentsDirectory)
                loadsave.saveTable(multiverse, "multiverse.json" , system.DocumentsDirectory)

                print("4. sys_ID = ", params.sys_ID, "    4. gal_ID = ", params.gal_ID, "    star_ID = ", params.star_ID, "hole_ID = ", params.hole_ID)
                print("4.   star_mark = ", params.star_mark, "    system_mark = ", params.system_mark)
            end 

            --SAVE INFORMATION
            loadsave.saveTable(params, "params.json" , system.DocumentsDirectory)

            composer.removeHidden()
            composer.gotoScene("scripts.scene_galaxy", "slideLeft")
        end

    return true
end








--DEFINE LOCAL REFERENCED TO DISPLAY OBJECTS
local background
local sun
local circle
local solar_ring
local button_left

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- view here runs when the scene is first created but has not yet appeared on screen

    
    
    
   --data.stars[params.star_ID]:get_image()

    display.setDefault( "isAnchorClamped", false )
    
    --Display the Appropriate star image/button
    
    sun = display.newImageRect(sceneGroup, stars[params.star_ID].image, 100, 100)
    sun.x =  display.contentCenterX ; sun.y = display.contentCenterY;

    circle = display.newCircle (sceneGroup, 100,100,200)
    circle:setFillColor(0,0,0,0) --This will set the fill color to transparent
    circle.strokeWidth = 3 --This is the width of the outline of the circle
    circle.x = display.contentCenterX; circle.y = display.contentCenterY
    circle:setStrokeColor(1,1,1) --This is the color of the outline




    --assign the max value off for loop to be the total number of planets in the current solar system
    local max = 0

    local ring_x = 200
    local ring_y = 200
    local anchor = -4.0
    local distance_x = 25
    local distance_y = 25
    local count = 1
    
    

    --returns integer representing starting index of corresponding planets to current solar system
    max = solar_sys[params.sys_ID].pnum
    local start = solar_sys[params.sys_ID].p_start
    local stop = start + max - 1
    local flag = 0
    local init_flag = 0

    --for each planet in the current solar system: create a ring, and a corresponding revolving planet image/button
    for i = start,stop do
     

        P_ID[count] = i

        --create rings
        rings[count] = display.newImageRect(sceneGroup, "Images/solar_ring.png", ring_x, ring_y)
        solar_ring = rings[count]
        solar_ring.x = display.contentCenterX; solar_ring.y = display.contentCenterY
        solar_ring.x = display.contentCenterX; solar_ring.y = display.contentCenterY
        


        --create  planet images

        --if planet hasnt been created yet, and 
        if planets[i] == nil  then
            print(planets[i] == nil)

            planet_ss[count] = widget.newButton{
            defaultFile = "Images/area_circle.png"
            }

            planet_ss[count].image = "area_circle.png"
            
            planet_ss[count].param = i
            flag = 0

            --if no planets have been visited -- WHEN TRAVELING TO NEW SOLAR SYSTEM

            if (solar_sys[params.sys_ID].init == false) then
                planet_ss[count]:addEventListener("touch", goto_planet)
                solar_sys[params.sys_ID]:set_init(true) --initialize the system
            end

        
        --if planet has already been visited
        else
            --print(planets[i] == nil)

            planet_ss[count] = widget.newButton{
            defaultFile = planets[i].ss_image}

            flag = 1
            planet_ss[count].image = planets[i].ss_image
            --planet_ss[count]:addEventListener("touch", goto_planet)
            planet_ss[count].param = i
            planet_ss[count]:addEventListener("touch", goto_planet)
            init_flag = 1
        end


        --if the current planet has been unlocked
      
        if flag == 0 and init_flag == 1  then
            
            planet_ss[count]:addEventListener("touch", goto_planet)
            init_flag = 0
        end

        sceneGroup:insert(planet_ss[count])
        planet_ss[count].anchorX = anchor

        --these conditional statements used to limit range of speed of planet revolution
        if anchor >= -2.0 then
            anchor = -6.0

        else
            anchor = anchor + 1
        end

        --display revolving planet images, on the event that a planet button is touched, 
        --call the appropriate planet even handler

        --local radius = ring_x/2
        --create_rotation(planet_ss[count], radius,display.contentCenterX, display.contentCenterY)
        planet_ss[count].x = display.contentCenterX + distance_x; planet_ss[count].y = display.contentCenterY + distance_y
        --create_rotation(planet_ss[count], radius,display.contentCenterX, display.contentCenterY)
        transition.to( planet_ss[count], { time=10000, rotation=-360, iterations=0 } ) 

            
        
         
         
        --print(planet_ss[count].param, "\n")

        --INCREMENT NECESSARY VALUES 
        ring_x = ring_x + 40
        ring_y = ring_x
        distance_x = distance_x + 30
        distance_y = distance_y + 30
        count = count + 1
        flag = 1
        
    end 


     button_left = widget.newButton { 
        width = 200,
        height = 70, 
        defaultFile = "images/left_arrow.png",
        overFile = "images/left_arrow_overfile.png",
        
    }

    sceneGroup:insert(button_left)

    button_left.x = display.contentCenterX - 200; button_left.y = display.contentCenterY - 400

    button_left:addEventListener("touch", goto_galaxy)

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



