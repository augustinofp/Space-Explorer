local master = require("master_storage")

Class multiverse = {} -- table representing class multiverse
multiverse.__index = multiverse --failed table lookups will fall back to multiverse table

-- local universe = master.get_universe() -- create a local reference to table of existing universes

-- master.tablelength(universe) 


function multiverse.new(a1,a2,a3, uni_num)
	local self = setmetatable({}, multiverse)
	self.a1 = a1
	self.a2 = a2
	self.a3 = a3
	self.uni_num = uni_num
	return self
end

function Planet.set_a1(self, val)
	self.a1 = val
end

function Planet.get_a1(self)
	return self.a1
end

function Planet.set_a2(self, val)
	self.a2 = val
end

function Planet.get_a2(self)
	return self.a2
end

function Planet.set_a3(self, val)
	self.a3 = val
end

function Planet.get_a3(self)
	return self.a3
end

function Planet.set_uni_num(self, val)
	self.uni_num = val
end

function Planet.get_uni_num(self)
	return self.uni_num
end