-- Battle System Class

local battle_system = {} -- table representing Battle class
battle_system.__index = battle_system --failed table lookups should fall back to class table to get methods 
	


function battle_system.new( Name, Description, Image, RequiredLevel, Damage, Shield, Cost, Upgrade, BuildTime)
	
	local self = setmetatable({}, resource_system)

	self.Name = Name
	self.Description = Description
	self.Image = Image
	self.RequiredLevel = RequiredLevel
	self.Damage = Damage
	self.Shield = Shield
	self.Cost = Cost
	self.Upgrade = Upgrade
	self.BuildTime = BuildTime

  	return self
end


function battle_system.set_RequiredLevel(self, RequiredLevel)
	self.RequiredLevel = RequiredLevel
end

function battle_system.get_RequiredLevel(self)
	return self.RequiredLevel
end

function battle_system.set_Damage(self, Damage)
	self.Damage = Damage
end

function battle_system.get_Damage(self)
	return self.Damage
end

function battle_system.set_Shield(self, Shield)
	self.Shield = Shield
end

function battle_system.get_Shield(self)
	return self.Shield
end

function battle_system.set_Cost(self, Cost)
	self.Cost = Cost
end

function battle_system.get_Cost(self)
	return self.Cost
end

function battle_system.set_Upgrade(self, Upgrade)
	self.Upgrade = Upgrade
end

function battle_system.get_Upgrade(self)
	return self.Upgrade
end

function battle_system.set_BuildTime(self, BuildTime)
	self.BuildTime = BuildTime
end

function battle_system.get_BuildTime(self)
	return self.BuildTime
end

return battle_system


-- Battle Systems Objects 



