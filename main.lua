local World = require ("world") 
local Component = require "component"
local System = require "system"

function new_body(x, y)
	local body = Component.new "body"
	body.x = x
	body.y = y
	return body
end


function new_rectangle_component()
	return Component.new "rect"
end

function new_renderer_system()
	local renderer = System.new {"body", "rect"}
	if renderer == nil then print "it's nil" else print "wtf" end
	
	function renderer:load(entity)
		print "found one"
	end
	
	function renderer:draw(entity)
		
	end
	return renderer
end


function love.load()
	World:register(new_renderer_system())
	local entity = World:create()
	entity:add(new_body(100,100))
	entity:add(new_rectangle_component())
end


function love.update()
	World:update(dt)
end


function love.draw()
	World:draw()
end
