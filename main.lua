local Gamestate = require "hump.gamestate"

gGame = {}
gMenu = {}
gCredits = {}

require "menu"
require "game"
require "combo_line"

local World = require "world"
local Component = require "component"
local System = require "system"
local coms = require "common_components"

local lg = love.graphics
local isDown = love.keyboard.isDown



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
	menufont = lg.newFont("aztecways.ttf", 200)
	font = lg.newFont("roboto.ttf", 70)
	Gamestate.switch(gMenu)
	--Gamestate.switch(gGame)

	--World:register(new_renderer_system())
	
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
end


function love.update(dt)
	World:update(dt)
end


function love.draw()
	World:draw()
end
