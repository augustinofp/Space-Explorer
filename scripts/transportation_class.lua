-- Transportation System Class

local transportation_system = {} -- table representing transportation class
transportation_system.__index = transportation_system --failed table lookups should fall back to class table to get methods 
	


function transportation_system.new( Name, Description, Image, RequiredLevel, Speed, TravelLimits, TravelCost, Cost, Upgrade, BuildTime)
	
	local self = setmetatable({}, resource_system)

	self.Name = Name
	self.Description = Description
	self.Image = Image
	self.RequiredLevel = RequiredLevel
	self.Speed = Speed
	self.TravelLimits = TravelLimits
	self.TravelCost = TravelCost
	self.Cost = Cost
	self.Upgrade = Upgrade
	self.BuildTime = BuildTime

  	return self
end


function transportation_system.set_RequiredLevel(self, RequiredLevel)
	self.RequiredLevel = RequiredLevel
end

function tansportation_system.get_RequiredLevel(self)
	return self.RequiredLevel
end

function transportation_system.set_Speed(self, Speed)
	self.Speed = Speed
end

function transportation_system.get_Speed(self)
	return self.Speed
end

function transportation_system.set_TravelLimits(self, TravelLimits)
	self.TravelLimits = TravelLimits
end

function transportation_system.get_TravelLimits(self)
	return self.TravelLimits
end

function transportation_system.set_TravelCost(self, TravelCost)
	self.TravelCost = TravelCost
end

function transportation_system.get_TravelCost(self)
	return TravelCost
end

function transportation_system.set_Cost(self, Cost)
	self.Cost = Cost
end

function transportation_system.get_Cost(self)
	return self.Cost
end

function transportation_system.set_Upgrade(self, Upgrade)
	self.Upgrade = Upgrade
end

function transportation.get_Upgrade(self)
	return self.Upgrade
end

function transportation_system.set_BuildTime(self, BuildTime)
	self.BuildTime = BuildTime
end

function transportation.get_BuildTime(self)
	return self.BuildTime
end

return transportation_system

-- Transportation Systems 

-- Wagon Object 
local wagon = transportation_system.new("wagon", "enables travel","Images/wagon.png", 1, 1, 1, 1, 1)

-- Hot Air Balloon Object 
local hot_air_balloon = transportation_system.new("hot-air-balloon", "enables travel","Images/hot-air-balloon.png", 2, 2, 2, 2, 2)

-- Car Object 
local car = transportation_system.new("car", "enables travel","Images/car.png", 3, 3, 3, 3, 3)

-- Plane Object 
local plane = transportation_system.new("plane", "enables travel","Images/plane.png", 4, 4, 4, 4, 4)

-- Launch Pad Object 
local launch_pad = transportation_system.new("launch-pad", "enables travel","Images/launch-pad.png", 5, 5, 5, 5, 5)

-- Rocket Object 
local rocket = transportation_system.new("rocket", "enables travel","Images/rocket.png", 6, 6, 6, 6, 6)

-- Space Shuttle Object 
local space_shuttle = transportation_system.new("space-shuttle", "enables travel","Images/space-shuttle.png", 7, 7, 7, 7, 7)

-- Space Elevator Object 
local space_elevator = transportation_system.new("space-elevator", "enables travel","Images/space-elevator.png", 8, 8, 8, 8, 8)

-- Advanced Space Shuttle Object 
local advanced_space_shuttle = transportation_system.new("advanced-space-shuttle", "enables travel","Images/advanced-space-shuttle.png", 9, 9, 9, 9, 9)

-- Solar Sail Object 
local solar_sail = transportation_system.new("solar-sail", "enables travel","Images/solar-sail.png", 10, 10, 10, 10, 10)

-- Orio Nuclear Pulse Object 
local orion_nuclear_pulse = transportation_system.new("orio-nuclear-pulse", "enables travel","Images/orio-nuclear-pulse.png", 11, 11, 11, 11, 11)

-- Galactic Cruiser Object 
local galactic_cruiser = transportation_system.new("galactic-cruiser", "enables travel","Images/galactic-cruiser.png", 12, 12, 12, 12, 12)

-- Teleporter Object 
local teleporter = transportation_system.new("teleporter", "enables travel","Images/teleporter.png", 13, 13, 13, 13, 13)

-- Alcubriere Drive Object 
local alcubriere_drive = transportation_system.new("alcubriere-drive", "enables travel","Images/alcubriere-drive.png", 14, 14, 14, 14, 14)

-- Worm Hole Object 
local worm_hole = transportation_system.new("worm-hole", "enables travel","Images/worm-hole.png", 15, 15, 15, 15, 15)

-- Black Hole Object 
local black_hole = transportation_system.new("black-hole", "enables travel","Images/black-hole.png", 16, 16, 16, 16, 16)
