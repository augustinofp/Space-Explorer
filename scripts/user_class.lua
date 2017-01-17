--User Class
local user = {} -- table representing user class
user.__index = user --failed table lookups should fall back to class table to get methods 
	


function user.new(explorers, energy, resources, gold, premiumCurrency)
	local self = setmetatable({}, user)

  self.explorers = explorers
  self.energy = energy
  self.resources = resources
  self.gold = gold 
  self.premiumCurrency = premiumCurrency
  return self
end





function user.set_explorers(self, explorers)
	self.explorers = explorers
end

function user.get_explorers(self)
	return self.explorers
end

function user.set_energy(self, energy)
	self.energy = energy
end

function user.get_energy(self)
	return self.energy
end


function user.set_resources(self, resources)
	self.resources = resources
end

function user.get_resources(self)
	return self.resources
end

function user.set_gold(self, gold)
	self.gold = gold
end

function user.get_gold(self)
	return self.gold
end

function user.set_premiumCurrency(self, premiumCurrency)
  self.premium-currency = premium-currency
end

function user.get_premiumCurrency(self)
  return self.premiumCurrency
end



return user