local loadsave = require("scripts.loadsave")
local local_data = require("scripts.local_data")
--global variable list

local master = {}
master.__index = master

-- function master.new(planets, stars, solar_sys, blackholes, galaxy, universe, multiverse, params, init_flag)
--  	local self = setmetatable({}, master)

-- 	self.planets = planets
-- 	self.stars = stars
-- 	self.solar_sys = solar_sys
-- 	self.blackholes = blackholes
-- 	self.galaxy = galaxy
-- 	self.universe = universe
-- 	self.multiverse = multiverse
-- 	self.params = params
-- 	self.init_flag = init_flag

-- 	return true
-- end
 
function master.new(data, init)
	local self = setmetatable({}, master)
	local_data = data

	if init == false then
		print("I am here")

		self.planets = {}
		print(self.planets)
		self.stars = {}
		self.solar_sys = {}
		self.blackholes = {}
		self.galaxy = {}
		self.universe = {}
		self.multiverse = {}
		self.params = {}
		self.init_flag = 0
		print(self.init_flag)

	else
		print("i AM HERE")
		print(local_data.planets)
		self.planets = local_data.planets
		self.stars = local_data.stars
		self.solar_sys = local_data.solar_sys
		self.blackholes = local_data.blackholes
		self.galaxy = local_data.galaxy
		self.universe = local_data.universe
		self.multiverse = local_data.multiverse
		self.params = local_data.params
		self.init_flag = local_data.init_flag
	end

	print("this is saved")
	return self
end

function master.splanets(self, planets)
	self.planets = planets
end

function master.gplanets(self)
	return self.planets
end


function master.sstars(self, stars)
	self.stars = stars
end

function master.gstars(self)
	return self.stars
end


function master.ssystem(self, system)
	self.solar_sys = system
end

function master.gsystem(self)
	return self.solar_sys
end


function master.sblackholes(self, blackholes)
	self.blackholes = blackholes
end

function master.gblackholes(self)
	return self.blackholes
end


function master.sgalaxy(self, galaxy)
	self.galaxy = galaxy
end

function master.ggalaxy(self)
	return self.galaxy
end


function master.suniverse(self, universe)
	self.universe = universe
end

function master.guniverse(self)
	return self.universe
end


function master.smultiverse(self, multiverse)
	self.multiverse = multiverse
end

function master.gmultiverse(self)
	return self.multiverse
end


function master.sparams(self, params)
	self.params = params
end 

function master.gparams(self)
	return self.params
end


function master.sinit_flag(self, init_flag)
	self.init_flag = init_flag
end

function master.ginit_flag(self)
	return self.init_flag
end



return master































