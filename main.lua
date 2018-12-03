local Gamestate = require "hump.gamestate"
require "game"
require "combo_line"
--cursor = 1

local World = require "world"
local Component = require "component"
local System = require "system"
local coms = require "common_components"

local lg = love.graphics
local isDown = love.keyboard.isDown

function new_renderer_system()
	local renderer = System.new {"body", "rect"}
	
	function renderer:load(entity)
		
	end
	
	function renderer:draw(entity)
		local body = entity:get "body"
		love.graphics.rectangle('fill', body.x, body.y, 32, 64)
	end
	return renderer
end

--[[function new_combo_manager_system()
	local manager = System:new {"combo"}
	function manager:draw(entity)
		local combo = entity:get "combo"
		
	end
	
end]]



function love.load()
	math.randomseed(os.time())
	love.keyboard.setKeyRepeat(false)
	Gamestate.registerEvents()
	W, H = lg.getWidth(), lg.getHeight()
	font = lg.newFont("roboto.ttf")
	Gamestate.switch(gGame)

	World:register(new_renderer_system())
	World:register(new_combo_line_manager())
	--[[local entity = World:create()
	entity:madd(coms.new_body(100,100))
		  :madd(coms.new_rectangle_component())
	--local entity2 = World:create()
	--entity2:add (new_body(100,200))
	--entity2:add(new_rectangle_component())
	
	local test = World:assemble{
		{coms.new_body, 100, 300},
		{coms.new_rectangle_component}
	}]]
	--for i, val in ipairs(queue[1]) do print (val) end
	local manager = World:create()
	manager:add(new_combo())
	manager:add(coms.new_sprite(key_sheet, key_sprit))
end


function love.update(dt)
	World:update(dt)
end
