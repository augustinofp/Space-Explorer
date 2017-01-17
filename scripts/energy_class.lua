local energy_system = {} -- table representing windmill class
energy_system.__index = energy_system --failed table lookups should fall back to class table to get methods 
	


function energy_system.new( Name, Description, Image, RequiredLevel, EnerygyAccumulationRate, Cost, Upgrade)
	
	local self = setmetatable({}, energy_system)

	self.Name = Name
	self.Description = Description
	self.Image = Image
	self.RequiredLevel = RequiredLevel
	self.EnerygyAccumulationRate = EnerygyAccumulationRate
	self.Cost = Cost
	self.Upgrade = Upgrade

  	return self
end


function energy_system.set_Level(self, RequiredLevel)
	self.RequiredLevel = RequiredLevel
end

function energy_system.get_Level(self)
	return self.RequiredLevel
end

function energy_system.set_EnergyAccumulationRate(self, EnerygyAccumulationRate)
	self.EnergyAccumulationRate = EnerygyAccumulationRate
end

function energy_system.get_EnergyAccumulationRate(self)
	return self.EnerygyAccumulationRate
end

return energy_system


local solar_panel = energy_system.new("Solar Panel", "This is a decription for a solar panel", "Images/panel.png", 0, 30, 5000, 10000)