function createETP(PBase, Mass1, Mass2, Mass3, Mass4, Mass5, Mass6)

-- create new group

    --local newETP = display.newGroup()

--load PBase corresponding to selected ss planet icon

  local planetBase = {"images/ETP/Pbase_1.png"}
    local PBase = planetBase[math.random(1)]

    -- PBase.x = contentCenterX; PBase.y = contentCenterY
    --newETP:insert( PBase )

-- create and insert all Mass and PBase into group

  local Mass1 = {"images/ETP/Mass1_1.png", "images/ETP/Mass1_2.png"}
    

    local M1 = Mass1[math.random(2)]
    --M1.x = contentCenterX; M1.y = contentCenterY
    --newETP:insert( M1 )
  
  local Mass2 = {"images/ETP/Mass2_1.png", "images/ETP/Mass2_2.png"}

    local M2 = Mass2[math.random(2)]
    --M2.x = contentCenterX; M2.y = contentCenterY
    --newETP:insert( M2 )
  
  local Mass3 = {"images/ETP/Mass3_1.png", "images/ETP/Mass3_2.png"}

    local M3 = Mass3[math.random(2)]
    --M3.x = contentCenterX; M3.y = contentCenterY
    --newETP:insert( M3 )
  
  local Mass4 = {"images/ETP/Mass4_1.png", "images/ETP/Mass4_2.png"}

    
    local M4 = Mass4[math.random(2)]
    --M4.x = contentCenterX; M4.y = contentCenterY
    --newETP:insert( M4 )
  
  local Mass5 = {"images/ETP/Mass5_1.png", "images/ETP/Mass5_2.png"}

    
    local M5 = Mass5[math.random(2)]
    --M5.x = contentCenterX; M5.y = contentCenterY
    --newETP:insert( M5 )
  
  local Mass6 = {"images/ETP/Mass6_1.png", "images/ETP/Mass6_2.png"}
    
    local M6 = Mass6[math.random(2)]
    --M6.x = contentCenterX; M6.y = contentCenterY
    --newETP:insert( M6 )

    local t = {PBase, M1, M2, M3, M4, M5, M6}
    return t


end    

