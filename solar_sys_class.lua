
local SolarSystem = {}
SolarSystem.__index = SolarSystem

function SolarSystem.new(planet_number, ring_size, start)
	local self = setmetatable({}, SolarSystem)
	self.planet_number = planet_number
	self.ring_size = ring_size
	self.start = start
	return self
end  

function set_planet_number(self, number)
	self.planet_number = number

end

function get_planet_number(self)
	return self.planet_number
end

function set_ring_size(self, ring_size)
	self.ring_size = ring_size
end

function get_ring_size(self)
	return self.ring_size
end

function get_start(self)
	return self.start
end

function set_start(self, start)
	self.start = start
end

