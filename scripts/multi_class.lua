---MULTIVERSE CLASS: LAST UPDATE (Jan.17, 2017)

local multiverse = {} -- table representing class multiverse
multiverse.__index = multiverse --failed table lookups will fall back to multiverse table

-- local universe = master.get_universe() -- create a local reference to table of existing universes

-- master.tablelength(universe) 


function multiverse.new(uni_num, u_start, multi_ID, init)
	local self = setmetatable({}, multiverse)
	self.unum = uni_num
	self.start = u_start
	self.multi_ID = multi_ID
	self.init = init
	return self
end

function multiverse.set_unum(self, val)
	self.unum = val
end

function multiverse.get_unum(self)
	return self.unum
end

function multiverse.set_start(self, val)
	self.start = val
end

function multiverse.get_start(self)
	return self.start
end

function multiverse.set_multiID(self, val)
	self.a3 = val
end

function multiverse.get_multiID(self)
	return self.a3
end

function multiverse.set_init(self, val)
	self.init = val
end

function multiverse.get_init(self)
	return self.init
end

return multiverse