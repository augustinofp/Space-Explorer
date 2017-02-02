local universe = {}
universe.__index = universe
--ring_size
function universe.new(image, image_ss, gnum, g_start, uni_ID, multi_ID, init)
	local self = setmetatable({}, universe)
	self.image = image
	self.image_ss = image_ss
	self.start = g_start
	self.gnum = gnum
	--self.s_unlock = s_unlock
	self.uni_ID = uni_ID
	self.multi_ID = multi_ID
	self.init = init
	--self.ring_size = ring_size
	return self
end  

function universe.set_gnum(self, number)
	self.gnum = number

end

function universe.get_gnum(self)
	return self.gnum
end


-- function galaxy.set_s_unlock(self, number)
-- 	self.s_unlock = number

-- end

-- function galaxy.get_s_unlock(self)
-- 	return self.s_unlock
-- end

function universe.set_start(self, number)
	self.start = number

end

function universe.get_start(self)
	return self.start
end

function universe.set_uni_ID(self, uni_ID)
	self.uni_ID = uni_ID
end

function universe.get_uni_ID(self)
	return self.uni_ID
end

function universe.set_multi_ID(self, multi_ID)
	self.gal_ID = gal_ID
end

function universe.get_multi_ID(self)
	return self.multi_ID
end


function universe.set_init(self, init)
	self.init = init
end

function universe.get_init(self)
	return self.init
end

function universe.set_image(self, image)
	self.image = image
end

function universe.get_image(self)
	return self.image
end

function universe.set_image_ss(self, image_ss)
	self.image_ss = image_ss
end

function universe.get_image_ss(self)
	return self.image_ss
end





return universe