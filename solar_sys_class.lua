local solar = {}
solar.__index = solar
--ring_size
function solar.new(planet_number, p_start, gal_ID)
	local self = setmetatable({}, solar)
	self.pnum = planet_number
	self.p_start = p_start
	self.gal_ID = gal_ID
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

function solar.set_p_start(self, number)
	self.p_start = number

end

function solar.get_p_start(self)
	return self.p_start
end

function solar.set_gal_ID(self, number)
	self.gal_ID = number

end

function solar.get_gal_ID(self)
	return self.gal_ID
end

return solar