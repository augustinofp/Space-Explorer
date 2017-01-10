local solar = {}
solar.__index = solar
--ring_size
function solar.new(planet_number, start)
	local self = setmetatable({}, solar)
	self.pnum = planet_number
	self.start = start
	--self.ring_size = ring_size
	return self
end  

function solar.set_pnum(self, number)
	self.pnum = number

end

function solar.get_pnum(self)
	return self.pnum
end

-- function set_ring_size(self, ring_size)
-- 	self.ring_size = ring_size
-- end

-- function get_ring_size(self)
-- 	return self.ring_size
-- end

function solar.set_start(self, number)
	self.start = number

end

function solar.get_start(self)
	return self.start
end

return solar