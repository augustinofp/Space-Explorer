local data = require("scripts.register")
local composer = require( "composer" )
local scene = composer.newScene()
local universe = require("scripts.universe_class")
local multiverse = require("scripts.multi_class")

local widget = require "widget"
widget.setTheme("widget_theme_ios7")

local physics = require "physics"
physics.start()
physics.setGravity(0,0




-- local forward references should go here

local universes = data.universe
local solar_sys = data.solar_sys
local stars = data.stars
local planets = data.planets
local galaxy = data.galaxy
local params = data.params
local blackholes = data.blackholes

--initialize ID local references


local uni_ID = {}
--local rings = {}
local uni_ss = {}


 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------


function goto_universe(event)
    
    --update params table
    if(event.phase == "ended") then
        params.uni_ID = event.target.param
        

        --if universe hasnt been visited
        if event.target.image == "area_circle.png" then
            
            universe[params.uni_ID] = uload.load( params.uni_ID, params.multi_ID, params.galaxy_mark, false)
            
            params.universe_mark = params.universe_mark + 1

            --SAVE INFORMATION
            loadsave.saveTable(planets, "planets.json" , system.DocumentsDirectory)
            loadsave.saveTable(stars, "stars.json" , system.DocumentsDirectory)
            loadsave.saveTable( blackholes, "blackholes.json" , system.DocumentsDirectory) 
            loadsave.saveTable(solar_sys, "solar_sys.json" , system.DocumentsDirectory)
            loadsave.saveTable(galaxy, "galaxy.json" , system.DocumentsDirectory)
            loadsave.saveTable(universe, "universe.json" , system.DocumentsDirectory)
            loadsave.saveTable(multiverse, "multiverse.json" , system.DocumentsDirectory)

            print("5. universe mark = ",  params.universe_mark)
        end


        --SAVE INFORMATION
        loadsave.saveTable(params, "params.json" , system.DocumentsDirectory)

        composer.removeHidden()
        composer.gotoScene("scripts.scene_universe", "fade")
    end

    return true
end

function goto_credits(event)
	if(event.phase == "ended") then
		--get total number of planets/systems etc... discovered
		--get/modify final user attribute totals (resources, wealth)

       --SAVE INFORMATION
            loadsave.saveTable(planets, "planets.json" , system.DocumentsDirectory)
            loadsave.saveTable(stars, "stars.json" , system.DocumentsDirectory)
            loadsave.saveTable( blackholes, "blackholes.json" , system.DocumentsDirectory)
            loadsave.saveTable(solar_sys, "solar_sys.json" , system.DocumentsDirectory)
            loadsave.saveTable(galaxy, "galaxy.json" , system.DocumentsDirectory)
            loadsave.saveTable(universe, "universe.json" , system.DocumentsDirectory)
            loadsave.saveTable(multiverse, "multiverse.json" , system.DocumentsDirectory)
            loadsave.saveTable(params, "params.json" , system.DocumentsDirectory)


		composer.removeHidden()
        composer.gotoScene("scripts.scene_credits", "fade")



end


--DEFINE LOCAL REFERENCED TO DISPLAY OBJECTS
local background
local multiverse
local circle
local solar_ring
local button_left


-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- view here runs when the scene is first created but has not yet appeared on screen


    

    display.setDefault( "isAnchorClamped", false )
    
    
    
   

    circle = display.newCircle (sceneGroup, 100,100,200)
    circle:setFillColor(0,0,0,0) --This will set the fill color to transparent
    circle.strokeWidth = 3 --This is the width of the outline of the circle
    circle.x = display.contentCenterX; circle.y = display.contentCenterY
    circle:setStrokeColor(1,1,1) --This is the color of the outline




    --assign the max value off for loop to be the total number of systems in the current galaxy
    local max = 0

    local ring_x = 200
    local ring_y = 200
    local anchor = -4
    local distance_x = 50
    local distance_y = 50
    local count = 1
    
    

    --returns integer representing starting index of corresponding universes in the multiverse
    max = multiverse[params.multi_ID].unum
    local start = multiverse[params.multi_ID].start
    local stop = start + max - 1
    local flag = 0
    local init_flag = 0

    --for each galaxy in the current universe: create a ring, and a corresponding revolving galaxy image/button
    for i = start,stop do
     

        uni_ID[count] = i

        -- --create rings
        -- rings[count] = display.newImageRect(sceneGroup, "Images/solar_ring.png", ring_x, ring_y)
        -- solar_ring = rings[count]
        -- solar_ring.x = display.contentCenterX; solar_ring.y = display.contentCenterY
        -- solar_ring.x = display.contentCenterX; solar_ring.y = display.contentCenterY
        


        --create  universe images

        --if universe hasnt been visited yet
        if universe[i] == nil then
            print(universe[i] == nil)

            uni_ss[count] = widget.newButton{
            defaultFile = "Images/area_circle.png"
            }

            uni_ss[count].image = "area_circle.png"
            
            uni_ss[count].param = i
            flag = 0

            --if no universes have been visited
            if (multiverse[params.multi_ID].init == false) then
                uni_ss[count]:addEventListener("touch", goto_universe)
                multiverse[params.multi_ID]:set_init(true) --initialize the multiverse
            end


        
        --if the universe has already been visited
        else
            print(universe[i] == nil)

            uni_ss[count] = widget.newButton{
            defaultFile = universe[i].ss_image
            }
            
            flag = 1
            uni_ss[count].image = universe[i].ss_image
            --planet_ss[count]:addEventListener("touch", goto_planet)
            uni_ss[count].param = i
            uni_ss[count]:addEventListener("touch", goto_universe)
            init_flag = 1
        end


        --if the current system has been unlocked
      
        if flag == 0 and init_flag == 1  then
            
            uni_ss[count]:addEventListener("touch", goto_universe)
            init_flag = 0
        end

        sceneGroup:insert(uni_ss[count])
        uni_ss[count].anchorX = anchor

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
        uni_ss[count].x = display.contentCenterX + distance_x; uni_ss[count].y = display.contentCenterY + distance_y
        --create_rotation(planet_ss[count], radius,display.contentCenterX, display.contentCenterY)
        transition.to( uni_ss[count], { time=40000, rotation=-360, iterations=0 } ) 

            
        
         
         
        --print(planet_ss[count].param, "\n")

        --INCREMENT NECESSARY VALUES 
        ring_x = ring_x + 40
        ring_y = ring_x
        distance_x = distance_x + 30
        distance_y = distance_y + 30
        count = count + 1
        flag = 1
        
    end 


    --Display the Appropriate multiverse image/button
    multi_back = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, 600 800)
    multi_back:toBack()
     button_left = widget.newButton { 
        width = 200,
        height = 70, 
        defaultFile = "images/left_arrow.png",
        overFile = "images/left_arrow_overfile.png",
        
    }

    sceneGroup:insert(button_left)

    button_left.x = display.contentCenterX - 200; button_left.y = display.contentCenterY - 400

    button_left:addEventListener("touch", goto_credits)

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
