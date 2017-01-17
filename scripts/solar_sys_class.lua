local solar = {}
solar.__index = solar
--ring_size
function solar.new(planet_number, p_start, sys_ID, gal_ID, p_init)
	local self = setmetatable({}, solar)
	self.pnum = planet_number
	--self.p_unlock = p_unlocked
	self.p_start = p_start
	self.gal_ID = gal_ID
	self.sys_ID = sys_ID
	self.init = p_init
	--self.ring_size = ring_size
	return self
end  

function solar.set_pnum(self, number)
	self.pnum = number

end

function solar.get_pnum(self)
	return self.pnum
end


-- function solar.set_p_unlock(self, number)
-- 	self.p_unlock = number

-- end

-- function solar.get_p_unlock(self)
-- 	return self.p_unlock
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

function solar.set_sys_ID(self, number)
	self.sys_ID = number

end

function solar.get_sys_ID(self)
	return self.sys_ID
end

function solar.set_init(self, number)
	self.init = number

end

function solar.get_init(self)
	return self.init
end


return solar