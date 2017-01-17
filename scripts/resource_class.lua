
local resource_system = {} -- table representing windmill class
resource_system.__index = resource_system --failed table lookups should fall back to class table to get methods 
	


function resource_system.new( Name, Description, Image, RequiredLevel, ResourceAccumulationRate, Cost, Upgrade, BuildTime)
	
	local self = setmetatable({}, resource_system)

	self.Name = Name
	self.Description = Description
	self.Image = Image
	self.RequiredLevel = RequiredLevel
	self.ResourceAccumulationRate = ResourceAccumulationRate
	self.Cost = Cost
	self.Upgrade = Upgrade
	self.BuildTime = BuildTime

  	return self
end


function resource_system.set_RequiredLevel(self, RequiredLevel)
	self.RequiredLevel = RequiredLevel
end

function resource_system.get_RequiredLevel(self)
	return self.RequiredLevel
end

function resource_system.set_ResourceAccumulationRate(self, ResourceAccumulationRate)
	self.ResourceAccumulationRate = ResourceAccumulationRate
end

function resource_system.get_ResourceAccumulationRate(self)
	return self.ResourceAccumulationRate
end

function resource_system.set_Cost(self, Cost)
	self.Cost = Cost
end

function resource_system.get_Cost(self)
	return self.Cost
end

function resource_system.set_Upgrade(self, Upgrade)
	self.Upgrade = Upgrade
end

function resource.get_Upgrade(self)
	return self.Upgrade
end

function resource_system.set_BuildTime(self, BuildTime)
	self.BuildTime = BuildTime
end

function resource.get_BuildTime(self)
	return self.BuildTime
end

return resource_system


-- Resource Objects

-- Well Object 
local well = resource_system.new("well", "well's collect resources", "Images/well.png", 1, 1, 1, 1, 1)

-- Winmill Object 
local windmill = resource_system.new("windmill", "windmill's collect resources", "Image/windmill.png", 2, 2, 2, 2, 2)

-- Farm Object 
local farm = resource_system.new("Farm", "Farm's collect resources", "Images/farm.png", 3, 3, 3, 3, 3)

-- Coal Mines Object 
local coal-mines = resource_system.new("coal-mines", "coal-mines collect resources", "Images/coal-mines.png", 4, 4, 4, 4, 4)

-- Industrial Factory Object 
local industrial-factory = resource_system.new("industrial-factory", "industrial-factory collect resources", "Images/industrial-factory.png", 5, 5, 5, 5, 5)

-- Oil Rig Object 
local oil-rig = resource_system.new("oil-rig", "oil-rig's collect reources", "Images/oil-rig.png", 6, 6, 6, 6, 6)

-- Satellites 
local satelitte = resource_system.new("satelitte", "satelitte's collect resources", "Images/satelitte.png", 7, 7, 7, 7, 7)

-- Space Station Object 
local space-station = resource_system.new("space-station", "space-station'  collect resources", "Images/space-station.png", 8, 8, 8, 8, 8)

--Elysium Station Object 
local elysium-station = resource_system.new("elysium-station", "elysium-station collect resources", "Images/elysium-station.png", 9, 9, 9, 9, 9)

-- Particle Accelerator Object 
local particle-accelerator = resource_system.new("particle-accelerator", "particle-accelerator's collect resources", "Images/particle-accelerator.png", 10, 10, 10, 10, 10)

-- Planet Extractor Object 
local planet-extractor = resource_system.new("planet-extractor", "planet-extractor's collect resources", "Images/planet-extractor.png", 11, 11, 11, 11, 11)

-- Planetary Space Station Object 
local planetary-space-station = resource_system.new("planetary-space-station", "planetary-space-station's collect resources", "Images/planetary-space-station.png", 12, 12, 12, 12, 12)

-- Quantum Computer Object 
local quauntum-computer = resource_system.new("quauntum-computer", "quauntum-computer's collect resources", "Images/quauntum-computer.png", 13, 13, 13, 13, 13)

-- Particle Assembler Object 
local particle-assembler = resource_system.new("particle-assembler", "particle-assembler's collect resources", "Images/particle-assembler", 14, 14, 14, 14, 14)

-- Planet Maker Object 
local planet-maker = resource_system.new("planet-maker", "planet-maker's collect resources", "Images/planet-maker.png", 15, 15, 15, 15 ,15)

-- Dark Matter Generator Object 
local dark-matter-generator = resource_system.new("dark-matter-generator", "dark-matter-generator's collect resources", "Images/dark-matter-generator.png", 16, 16, 16, 16, 16)

-- Star maker Object 
local star-maker = resource_system.new("star-maker", "star-maker's collect resources", "Images/star-maker.png", 17, 17, 17, 17, 17)

-- Quantum Plant Manipultor Object
local quauntum-plank-manipulator = resource_system.new("quauntum-plank-manipulator", "quauntum-plank-manipulator's collect resources", "Images/quauntum-plank-manipulator.png", 18, 18, 18, 18, 18)

-- Black Hole Maker Obejct 
local black-hole-maker = resource_system.new("black-hole-maker", "black-hole-maker's collect resources and can be used for travel","Images/black-hole-maker.png", 19, 19, 19, 19, 19)


