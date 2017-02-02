 local galaxy = {}
galaxy.__index = galaxy
--ring_size
function galaxy.new(snum, s_start, gal_ID, uni_ID, init)
	local self = setmetatable({}, galaxy)
	self.start = s_start
	self.snum = snum
	--self.s_unlock = s_unlock
	self.uni_ID = uni_ID
	self.gal_ID = gal_ID
	self.init = init
	--self.ring_size = ring_size
	return self
end  

function galaxy.set_snum(self, number)
	self.snum = number

end

function galaxy.get_snum(self)
	return self.snum
end


-- function galaxy.set_s_unlock(self, number)
-- 	self.s_unlock = number

-- end

-- function galaxy.get_s_unlock(self)
-- 	return self.s_unlock
-- end

function galaxy.set_start(self, number)
	self.start = number

end

function galaxy.get_start(self)
	return self.start
end

function galaxy.set_uni_ID(self, uni_ID)
	self.uni_ID = uni_ID
end

function galaxy.get_uni_ID(self)
	return self.uni_ID
end

function galaxy.set_gal_ID(self, gal_ID)
	self.gal_ID = gal_ID
end

function galaxy.get_gal_ID(self)
	return self.gal_ID
end


function galaxy.set_init(self, init)
	self.init = init
end

function galaxy.get_init(self)
	return self.init
end


return galaxy