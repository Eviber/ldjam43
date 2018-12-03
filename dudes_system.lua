local Component = require "component"
local System = require "system"
local World = require "world"
local coms = require "common_components"
local lg = love.graphics

function new_dudes_manager()
	local manager = System.new {"body", "sprite"}
	
	function manager:update(dt, entity)
		
	end
	
end
