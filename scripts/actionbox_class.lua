local actionbox = {} -- table representing windmill class
actionbox.__index = actionbox --failed table lookups should fall back to class table to get methods 
	


function actionbox.new( Image, Explorers, BuiltSystem, SystemLocation, ActionBoxType)
	
	local self = setmetatable({}, actionbox_system)

	self.Image = Image
	self.Explorers = Explorers
	self.BuiltSystem = BuiltSystem
	self.SystemLocation = SystemLocation
	self.ActionBoxType = ActionBoxType

  	return self
end


function actionbox.set_Image(self, Image)
	self.Image = Image
end

function actionbox.get_Image(self)
	return self.Image
end

function actionbox.set_Explorers(self, Explorers)
	self.Explorers = Explorers
end

function actionbox.get_Explorers(self)
	return self.Explorers
end

function actionbox.set_BuiltSystem(self, BuiltSystem)
	self.BuiltSystem = BuiltSystem
end

function actionbox.get_BuiltSystem(self)
	return self.BuiltSystem
end

function actionbox.set_SystemLocation(self, SystemLocation)
	self.SystemLocation = SystemLocation
end

function actionbox.get_BuiltSystem(self)
	return self.BuiltSystem
end

function actionbox.set_ActionBoxType(self, ActionBoxType)
	self.ActionBoxType = ActionBoxType
end

function actionbox.get_ActionBoxType(self)
	return self.ActionBoxType
end

return actionbox


-- Action Box Object 

--local actionbox_1 = actionbox_system.new("Images/area_circle.png", "Explorers: # of Explorers on the action box", "BuiltSystem: Energy System or Resource System", "SystemLocation", "ActionBoxType: Space or Terrain")






