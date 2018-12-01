local Gamestate = require "hump.gamestate"
require "game"

local World = require ("world") 
local Component = require "component"
local System = require "system"
local coms = require "common_components"

local lg = love.graphics
local isDown = love.keyboard.isDown

function new_renderer_system()
		local renderer = System.new {"body", "rect"}
		--if renderer == nil then print "it's nil" else print "wtf" end
		
		function renderer:load(entity)
			print "found one"
		end
		
		function renderer:draw(entity)
			local body = entity:get "body"
			love.graphics.rectangle('fill', body.x, body.y, 32, 64)
		end
		return renderer
	end


function love.load()
	Gamestate.registerEvents()
	W, H = lg.getWidth(), lg.getHeight()
	font = lg.newFont("roboto.ttf")
	Gamestate.switch(gGame)

	World:register(new_renderer_system())
	local entity = World:create()
	entity:madd(coms.new_body(100,100))
		  :madd(coms.new_rectangle_component())
	--local entity2 = World:create()
	--entity2:add (new_body(100,200))
	--entity2:add(new_rectangle_component())
	
	local test = World:assemble{
		{coms.new_body, 100, 300},
		{coms.new_rectangle_component}
	}
end


function love.update()
	World:update(dt)
end


function love.draw()
	World:draw()
end
