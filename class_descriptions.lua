

	local user = require("user_class")
-- User Stats

	user = {user.level, user.gold, user.resource, user.energy, user.explorer}
	user.level = 0
	user.gold = 0
	user.resource = 0 
	user.energy = 0
	user.explorer = 0 


-- Tables storing Build Objects Pertaining to Type of Civilization 

--Civilization Type
local civilizationType = {type0, type1, type2, type3, type4, type5, type6}

--Systems for Civilization Type

--Primitive
local type0 = {energySystems0, resourceSystems0, transportationSystems0, battleSystems0, decorations0}

--Semi-Planetary
local type1 = {energySystems1, resourceSystems1, transportationSystems1, battleSystems1, decorations1}

--Planetary
local type2 = {energySystems2, resourceSystems2, transportationSystems2, battleSystems2, decorations2}

--Stellar
local type3 = {energySystems3, resourceSystems3, transportationSystems3, battleSystems3, decorations3}

-- Galactic
local type4 = {energySystems4, resourceSystems4, transportationSystems4, battleSystems4, decorations4}

--Universial
local type5 = {energySystems5, resourceSystems5, transportationSystems5, battleSystems5, decorations5}

--Multiversial 
local type6 = {energySystems6, resourceSystems6, transportationSystems6, battleSystems6, decorations6}


--Primitive Enerygy Systems 
local energySystems0 = {fire, primitve-wind-turbine, primitive-water-turbine}

--Semi-Planetary Energy Systems
local energySystems1 = {tidal-power-plant, advanced-wind-turbine-farms, ground-solar-farms, nuclear-fission-power-plant, geothermal-plant }

--Planetary Energy Systems
local energySystems2 = {solar-space-farms, nuclear-fusion-power-plant}

--Stellar Energy Systems
local energySystems3 = {Dyson-sphere}

--Galactic Energy Systems
local energySystems4 = {anti-matter-generator}

--Universial Energy Systems
local energySystems5 = {dark-energy-generator}

--Multiversial Energy Systems
local energySystems6 = {negative-energy-generator}


-- Resource Systems 

-- Primitive Resource Systems
local resourceSystems0 = {well, windmill, farm, coal-mines}

-- Semi-Planetary Resource Systems 
local resourceSystems1 = {industrial-factory, oil-rig, satelitte, space-station}

-- Planetary Resource Systems 
local resourceSystems2 = {elysium-station, particle-accelerator}

-- Stellar Resource Systems 
local resourceSystems3 = {planet-extractor, planetary-space-station, quauntum-computer }

-- Galactic Resource Systems 
local resourceSystems4 = {particle-assembler, planet-maker}

-- Universial Resource Systems 
local resourceSystems5 = {dark-matter-generator, star-maker}

-- Multiversial Resource Systems 
local resourceSystems6 = {quauntum-plank-manipulator, black-hole-maker}


-- Transportation Systems 

-- Primitive Transportation Systems 
local transportationSystems0 = {wagon, hot-air-balloon}

-- Semi-Planetary Transportation Systems 
local transportationSystems1 = {car, plane, launch-pad, rocket, space-shuttle}

-- Planetary Transportation Systems 
local transportationSystems2 = {space-elevator, advanced-space-shuttle, solar-sail, orio-nuclear-pulse}

-- Stellar Transportation Systems 
local transportationSystems3 = {galactic-cruiser, teleporter}

-- Galactic Transportation Systems 
local transportationSystems4 = {alcubriere-drive}

-- Universial Transportation Systems 
local transportationSystems5 = {worm-hole}

-- Multiverisal Transportation Systems 
local transportationSystems6 = {black-hole}


-- Battle Systems 

-- Primitive Battle Systems 
local battleSystems0 = {catapult}

-- Semi-Planetary Battle Systems 
local battleSystems1 = {tanks}

-- Planetary Battle Systems 
local battleSystems2 = {bombers}

-- Stellar Battle Systems 
local battleSystems3 = {}

-- Galactic Battle Systems 
local battleSystems4 = {}

-- Universial Battle Systems
local battleSystems5 = {}

-- Multiverisal Battle Systems 
local battleSystems6 = {}


-- Decorations 

-- Primitve Decorations
local decorations0 = {}

-- Semi-Planetary Decorations
local decorations1 = {}

-- Planetary Decorations
local decorations2 = {}

-- Stellar Decorations 
local decorations3 = {}

-- Galactic Decorations 
local decorations4 = {}

-- Universial Decorations 
local decorations5 = {}

-- Multiversial Decorations
local decorations6 = {}


