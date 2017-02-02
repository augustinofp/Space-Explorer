--scene_solarsystem.lua
local planet = require("scripts.planet_class")
local star = require("scripts.star_class")
--local data = require("scripts.data_storage")
local galaxy_class = require("scripts.galaxy_class")
local composer = require( "composer" )
local sload = require("scripts.load_system")
local stload = require("scripts.load_star")
local uload = require("scripts.load_universe")
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
local stars = data.stars
local planets = data.planets
local galaxy = data.galaxy
local params = data.params
local blackholes = data.blackholes



print("P_ID = ", params.P_ID)
print("star_ID = ", params.star_ID)
print("sys_ID = ", params.sys_ID)
print("gal_ID = ", params.gal_ID)
print("hole_ID = ", params.hole_ID)


--initialize ID local references


local star_ID = {}
--local rings = {}
local star_ss = {}


 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------


function goto_solarsystem(event)
    
    --update params table
   
    if(event.phase == "ended") then
        params.sys_ID = event.target.param
        params.star_ID = event.target.param 

        --if system hasnt been visited
        if event.target.image == "area_circle.png" then
            
            solar_sys[params.sys_ID] = sload.load( params.sys_ID, params.gal_ID, params.planet_mark, false)
            stars[params.star_ID] = stload.load(params.sys_ID)


            params.system_mark = params.system_mark + 1
            params.star_mark = params.star_mark + 1

             --SAVE INFORMATION
            loadsave.saveTable(planets, "planets.json" , system.DocumentsDirectory)
            loadsave.saveTable(stars, "stars.json" , system.DocumentsDirectory)
            loadsave.saveTable(blackholes, "blackholes.json" , system.DocumentsDirectory)
            loadsave.saveTable(solar_sys, "solar_sys.json" , system.DocumentsDirectory)
            loadsave.saveTable(galaxy, "galaxy.json" , system.DocumentsDirectory)
            loadsave.saveTable(universe, "universe.json" , system.DocumentsDirectory)
            loadsave.saveTable(multiverse, "multiverse.json" , system.DocumentsDirectory)
            print("5. system mark = ",  params.system_mark)
        end

        --SAVE INFORMATION
        loadsave.saveTable(params, "params.json" , system.DocumentsDirectory)
        
        composer.removeHidden()
        composer.gotoScene("scripts.scene_solarsystem", "fade")
    end
    return true
end

function goto_universe(event)



    --update params table
    -- params.gal_ID
    -- data.galaxy[]
    

    

    
    if(event.phase == "ended") then 

        
        params.uni_ID = galaxy[params.gal_ID].uni_ID

        --if the universe needs to be created
        if universe[params.uni_ID] == nil then 

            universe[params.uni_ID] = uload.load(params.uni_ID, params.multi_ID, params.gal_ID, true)
            
            
            params.universe_mark = params.universe_mark + 1

             --SAVE INFORMATION
            loadsave.saveTable(planets, "planets.json" , system.DocumentsDirectory)
            loadsave.saveTable(stars, "stars.json" , system.DocumentsDirectory)
            loadsave.saveTable( blackholes, "blackholes.json" , system.DocumentsDirectory)
            loadsave.saveTable(solar_sys, "solar_sys.json" , system.DocumentsDirectory)
            loadsave.saveTable(galaxy, "galaxy.json" , system.DocumentsDirectory)
            loadsave.saveTable(universe, "universe.json" , system.DocumentsDirectory)
            loadsave.saveTable(multiverse, "multiverse.json" , system.DocumentsDirectory)

            print("4. sys_ID = ", params.sys_ID, "    4. gal_ID = ", params.gal_ID, "    star_ID = ", params.star_ID, "uni_ID = ", params.universe_ID)
            print("4.   star_mark = ", params.star_mark, "    system_mark = ", params.system_mark)
        end 


         --SAVE INFORMATION
        loadsave.saveTable(params, "params.json" , system.DocumentsDirectory)

        composer.removeHidden()
        composer.gotoScene("scripts.scene_universe", "slideLeft")
    end

    return true
end



--DEFINE LOCAL REFERENCED TO DISPLAY OBJECTS
local background
local blackhole
local circle
local solar_ring
local button_left
 

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- view here runs when the scene is first created but has not yet appeared on screen


    

    display.setDefault( "isAnchorClamped", false )
    
    --Display the Appropriate blackhole image/button
    
    blackhole = display.newImageRect(sceneGroup, blackholes[params.hole_ID].image, 100, 100)
    blackhole.x =  display.contentCenterX ; blackhole.y = display.contentCenterY;

    circle = display.newCircle (sceneGroup, 100,100,200)
    circle:setFillColor(0,0,0,0) --This will set the fill color to transparent
    circle.strokeWidth = 3 --This is the width of the outline of the circle
    circle.x = display.contentCenterX; circle.y = display.contentCenterY
    circle:setStrokeColor(1,1,1) --This is the color of the outline




    --assign the max value off for loop to be the total number of systems in the current galaxy
    local max = 0

    local ring_x = 200
    local ring_y = 200
    local anchor = -4.0
    local distance_x = 25
    local distance_y = 25
    local count = 1
    
    

    --returns integer representing starting index of corresponding systems to current galaxy
    max = galaxy[params.gal_ID].snum
    print(max)
    local start = galaxy[params.gal_ID].start
    print(start)
    local stop = start + max - 1
    local flag = 0
    local init_flag = 0

    --for each system in the current galaxy: create a ring, and a corresponding revolving star image/button
    for i = start,stop do
     

        star_ID[count] = i

        -- --create rings
        -- rings[count] = display.newImageRect(sceneGroup, "Images/solar_ring.png", ring_x, ring_y)
        -- solar_ring = rings[count]
        -- solar_ring.x = display.contentCenterX; solar_ring.y = display.contentCenterY
        -- solar_ring.x = display.contentCenterX; solar_ring.y = display.contentCenterY
        


        --create  star images

        --if system hasnt been visited yet
        
        if solar_sys[i] == nil then
            print("solar system ", i, " creation is: ", solar_sys[i] == nil)

            star_ss[count] = widget.newButton{
            defaultFile = "Images/area_circle.png"
            }

            star_ss[count].image = "area_circle.png"
            print(star_ss[count].image)
            
            star_ss[count].param = i
            flag = 0

            --if no systems have been visited
            if (galaxy[params.gal_ID].init == false) then
                star_ss[count]:addEventListener("touch", goto_solarsystem)
                galaxy[params.gal_ID]:set_init(true) --initialize the system
            end


        
        --if system has already been visited
        else
            print("solar system ", i, " creation is: ", solar_sys[i] == nil)

            star_ss[count] = widget.newButton{
            defaultFile = stars[i].ss_image}
            
            
            flag = 1
            star_ss[count].image = stars[i].ss_image
            print(i)
            print(stars[i].ss_image)
            print(star_ss[count].image)
            --planet_ss[count]:addEventListener("touch", goto_planet)
            star_ss[count].param = i
            star_ss[count]:addEventListener("touch", goto_solarsystem)
            init_flag = 1
        end


        --if the current system has been unlocked
      
        if flag == 0 and init_flag == 1  then
            
            star_ss[count]:addEventListener("touch", goto_solarsystem)
            init_flag = 0
        end

        sceneGroup:insert(star_ss[count])
        star_ss[count].anchorX = anchor

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
        star_ss[count].x = display.contentCenterX + distance_x; star_ss[count].y = display.contentCenterY + distance_y
        --create_rotation(planet_ss[count], radius,display.contentCenterX, display.contentCenterY)
        transition.to( star_ss[count], { time=20000, rotation=-360, iterations=0 } ) 

            
        
         
         
        --print(planet_ss[count].param, "\n")

        --INCREMENT NECESSARY VALUES 
        ring_x = ring_x + 40
        ring_y = ring_x
        distance_x = distance_x + 25
        distance_y = distance_y + 25
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

    button_left:addEventListener("touch", goto_universe)

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
