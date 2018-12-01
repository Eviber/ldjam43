local Gamestate = require "hump.gamestate"
local lg = love.graphics
local isDown = love.keyboard.isDown

require "game"

function love.load()
	Gamestate.registerEvents()
	W, H = lg.getWidth(), lg.getHeight()
	font = lg.newFont("roboto.ttf")
	Gamestate.switch(gGame)
end
