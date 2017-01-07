local Star = {} -- table representing class planet

Star.__index = Star --failed table lookups should fall back to class table to get methods 
	
function Star.new(type, toxicity, age, colours, level, image, ID)
	local self = setmetatable({}, Star)
  self.type = type
  self.toxicity = toxicity
 
  self.toxicity = toxicity
  self.age = age
  self.colours = colours

  self.level = level
  self.image = image

  return self

end

function Star.set_toxicity(self, toxicity)
	self.toxicity = toxicity
end

function Star.get_toxicity(self)
	return self.toxicity
end

function Star.set_age(self, age)
	self.age = age
end

function Star.get_age(self)
	return self.age
end

function Star.set_colours(self, colours)
	self.atmos = colours
end

function Star.get_colours(self)
	return self.colours
end

function Star.set_level(self, level)
	self.level = level
end

function Star.get_level(self)
	return self.level
end

function Star.set_image(self, image)
	self.image = image
end

function Star.get_image(self, image)
	return self.image
end

function Planet.set_ID(self, sys_ID)
	self.sys_ID = sys_ID
end

function Planet.get_ID(self)
	return self.sys_ID
end