 local galaxy = {}
galaxy.__index = galaxy
--ring_size
function galaxy.new(image, snum, start)
	local self = setmetatable({}, galaxy)
	self.image = image
	self.snum = snum
	self.start = start
	--self.ring_size = ring_size
	return self
end  

function galaxy.set_snum(self, number)
	self.snum = number

end

function galaxy.get_snum(self)
	return self.snum
end

-- function set_ring_size(self, ring_size)
-- 	self.ring_size = ring_size
-- end

-- function get_ring_size(self)
-- 	return self.ring_size
-- end

function galaxy.set_start(self, number)
	self.start = number

end

function galaxy.get_start(self)
	return self.start
end

function galaxy.set_image(self, image)
	self.image = image
end

function galaxy.get_image(self)
	return self.image
end

return galaxy