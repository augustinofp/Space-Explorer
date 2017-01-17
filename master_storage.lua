
local master = {}

master.__index = master

function master.new(planets, stars, solar_sys, galaxy, universe, multiverse)
	local self = setmetatable({}, master)
--planets, stars, solar_sys, galaxy, universe, multiverse
-- local planets = {}
-- local p_buttons = {}
-- local p_flags = {}
-- local solar_sys = {}
-- local sys_buttons = {}
-- local sys_flags = {}
-- local stars = {}
-- local star_buttons = {}
-- local star_flags = {}
-- local galaxy = {}
-- local gal_buttons = {}
-- local gal_flags = {}
-- local universe = {}
-- local uni_buttons = {}
-- local uni_flags = {}
-- local multiverse = {}
-- local multi_button = {}
-- local multi_flag = {}
-- local recent_planet
-- local recent_solar
-- local recent_gal
-- local recent_uni
-- local recent_multi
	self.planets = planets
	self.stars = stars
	self.solar_sys = solar_sys
	self.galaxy = galaxy
	self.universe = universe
	self.multiverse = multiverse
	return self
end









--FUNCTIONS FOR RETURNING OBJECT INFORMATION

function master.get_planets(self)
	return self.planets
end


function master.set_planets(self,index,planet)
	self.planets[index] = planet
end


function master.get_stars(self)
	return self.stars
end
function master.get_sys(self)
	return self.solar_sys
end

function master.get_galaxy(self)
	return self.galaxy
end

function master.get_universe(self)
	return self.universe
end

function master.get_multiverse(self)
	return self.multiverse
end


-- --FUNCTIONS FOR RETURNING BUTTON INFORMATION
-- function get_p_buttons()
-- 	return p_buttons
-- end

-- function get_star_buttons()
-- 	return star_buttons
-- end

-- function get_sys_buttons()
-- 	return sys_buttons
-- end

-- function get_gal_buttons()
-- 	return gal_buttons
-- end

-- function get_uni_buttons()
-- 	return uni_buttons
-- end

-- function get_multi_button()
-- 	return multi_button
-- end


-- --FUNCTIONS FOR GETTING FLAG INFORMATION

-- function get_p_flags()
-- 	return p_flags
-- end

-- function get_sys_flags()
-- 	return sys_flags
-- end

-- function get_star_flags()
-- 	return star_flags
-- end

-- function get_gal_flags()
-- 	return gal_flags
-- end

-- function get_uni_flags()
-- 	return uni_flags
-- end

-- function get_multi_flags()
-- 	return multi_flags
-- end


--FUNCTION FOR DETERMING THE NUMBER OF ENTRIES IN ANY TABLE

function master.tablelength(T)
	local count = 0
	for _ in pairs(T) do 
		count = count + 1 
	end
	return count
end



-- --FUNCTIONS FOR DETERMINING THE CURRENT OBJECT INSERTION POSITION OF TABLES

-- function planet_mark()
-- 	return planet_marker
-- end

-- function sys_mark()
-- 	return sys_marker
-- end

-- function star_mark()
-- 	return star_marker
-- end

-- function galaxy_mark()
-- 	return gal_marker
-- end

-- function universe_mark()
-- 	return uni_marker
-- end


-- local planet_marker = tablelength(planets) + 1  
-- local sys_marker = tablelength(solar_sys) + 1
-- local star_marker = tablelength(stars) + 1
-- local gal_marker = tablelength(galaxy) + 1
-- local uni_marker = tablelength(universe) + 1





return master



