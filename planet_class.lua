  
--Planet Class
local Planet = {} -- table representing class planet
Planet.__index = Planet --failed table lookups should fall back to class table to get methods 
	
	--atmos, out_mat, in_mat, toxicity, age, colours, habitation, level, 

function Planet.new(image, P_ID, sys_ID, gal_ID, ss_image)
	local self = setmetatable({}, Planet)
  -- self.atmos = atmos
  -- self.out_mat = out_mat
  -- self.in_mat = in_mat
  -- self.toxicity = toxicity
  -- self.age = age
  -- self.colours = colours
  -- self.habitation = habitation
  -- self.level = level
  self.image = image
  self.P_ID = P_ID
  self.sys_ID = sys_ID
  self.gal_ID = gal_ID
  self.ss_image = ss_image
  --self.unlock = unlocked
  return self
end

-- function Planet.set_atmos(self, val)
-- 	self.atmos = val
-- end

-- function Planet.get_atmos(self)
-- 	return self.atmos
-- end

-- function Planet.set_out_mat(self, out_mat)
-- 	self.out_mat = out_mat
-- end

-- function Planet.get_out_mat(self)
-- 	return self.out_mat
-- end

-- function Planet.set_in_mat(self, in_mat)
-- 	self.in_mat = in_mat
-- end

-- function Planet.get_in_mat(self)
-- 	return self.in_mat
-- end

-- function Planet.set_toxicity(self, toxicity)
-- 	self.toxicity = toxicity
-- end

-- function Planet.get_toxicity(self)
-- 	return self.toxicity
-- end

-- function Planet.set_age(self, age)
-- 	self.age = age
-- end

-- function Planet.get_age(self)
-- 	return self.age
-- end

-- function Planet.set_colours(self, colours)
-- 	self.atmos = colours
-- end

-- function Planet.get_colours(self)
-- 	return self.colours
-- end

-- function Planet.set_habitation(self, habitation)
-- 	self.habitation = habitation
-- end

-- function Planet.get_habitation(self)
-- 	return self.habitation
-- end

-- function Planet.set_level(self, level)
-- 	self.level = level
-- end

-- function Planet.get_level(self)
-- 	return self.level
-- end

function Planet.set_image(self, image)
	self.image = image
end

function Planet.get_image(self)
	return self.image
end

function Planet.set_planetID(self, P_ID)
	self.P_ID = P_ID
end

function Planet.get_planetID(self)
	return self.P_ID
end


function Planet.set_sysID(self, sys_ID)
	self.sys_ID = sys_ID
end

function Planet.get_sysID(self)
	return self.sys_ID
end

function Planet.set_galID(self, gal_ID)
  self.gal_ID = gal_ID
end

function Planet.get_galID(self)
  return self.gal_ID
end

function Planet.set_ssimage(self, ss_image)
	self.ss_image = ss_image
end

function Planet.get_ssimage(self)
	return self.ss_image
end

-- function Planet.set_unlock(self, unlocked)
--   self.unlock = unlocked
-- end

-- function Planet.get_unlock(self)
--   return self.unlock
-- end

return Planet