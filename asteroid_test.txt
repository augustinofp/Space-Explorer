


   math.randomseed( os.time() )
    math.random(); math.random(); math.random()





-- function asteroidAnimation()

    --     local end_i
    --     local end_j

     
    --     asteroidX = {xLeft = math.random(-10, 0) , xRight = math.random(700, 710)}
    --     asteroidY = {yUp = math.random(-2, 0) , yDown = math.random(900, 910)}
       
    --     i = math.random(2)
    --     j = math.random(2)

    --     asteroid = display.newImage(sceneGroup, "images/asteroid.png")
    --     asteroid.x = asteroidX[i] ; asteroid.y = asteroidY[j]

    --     if i == 1 then
    --         end_i = asteroidX[2]

    --     else 
    --         end_i = asteroidX[1]
    --     end

    --     if j == 1 then
    --         end_j = asteroidY[2]

    --     else
    --         end_j = asteroidY[1]

    --     end

    --     transition.to(asteroid , { time = 4000, x = end_i , y = end_j , onComplete = ast_transition})
    --     transition.to( asteroid, { rotation=365, time=5000, iterations =0 } )
    --     display.remove(asteroid)
    -- end

    -- function ast_transition()
    --     asteroidAnimation()
    -- end



    -- asteroidAnimation()

   --  asteroid2 = display.newImage(sceneGroup, "images/asteroid.png")

   -- function asteroidAnimation1()
   --      asteroid1 = display.newImage(sceneGroup, "images/asteroid.png")
   --      asteroid1.x = math.random(-10, 0 ); asteroid1.y = math.random(0, 900);
   --      transition.to (asteroid1, {time = 4000, x = math.random(900, 910), y = math.random(0, 900), onComplete = asteroidAnimation2})
   --      --transition.to( asteroid1, { rotation=365, time=5000, iterations =0 } )
   --      display.remove(asteroid2)
   --  end




    -- asteroidAnimation1()

    -- function asteroidAnimation2()
    --     asteroid2 = display.newImage(sceneGroup, "images/asteroid.png")
    --     asteroid2.x = math.random(700, 710); asteroid2.y = math.random(0, 900);
    --     transition.to (asteroid2, {time = 4000, x = math.random(-10, 0), y = math.random(0, 900), onComplete = asteroidAnimation1})
    --     --transition.to( asteroid2, { rotation=-365, time=5000, iterations =0 } )
    --     display.remove(asteroid1)
    -- -- end
    -- local start_x
    -- local end_x
    -- local asteroid

    

--     function asteroidAnimation(start_x, end_x)
--         asteroid = display.newImage(sceneGroup, "Images/asteroid.png")
--         asteroid.x = start_x; asteroid.y = math.random(0, 900);
--         local x2 = end_x
--         if start_x <= 0 then
--             start_x = math.random(900,910)
--             end_x = math.random(-10,0)
--         else
--             start_x = math.random(-10,0)
--             end_x = math.random(900,910)
--         end
--         transition.to (asteroid, {time = 4000, x = x2, y = math.random(0, 900), onComplete = asteroidAnimation(start_x, end_x)})
--         transition.to( asteroid, { rotation=365, time=5000, iterations =0 } )
        
--     end



-- --INITALIZE STARTING POSITION OF ASTEROID
--     start_x = math.random(900,910)
--     end_x = math.random(-10,0)

 

--     asteroidAnimation(start_x, end_x)
        

   