local Gamestate = require "hump.gamestate"
local lg = love.graphics
local isDown = love.keyboard.isDown
local World = require "world"
local Component = require "component"
local System = require "system"
local coms = require "common_components"
local dudes = require "dudes"

gGame = {}

local typelist = {}

function push()
	--table.insert(queue, dudes[math.random(#dudes)])
	table.insert(queue, World:assemble(typelist[math.random(#typelist)]))
end

function pop()
	table.remove(queue, 1)
	push()
end

function gGame:init()
	text = {
		up = lg.newText(font, "up"),
		down = lg.newText(font, "down"),
		left = lg.newText(font, "left"),
		right = lg.newText(font, "right")
	}
	sheet = lg.newImage("dudes.png")
	sprit = {}

	for y = 0, 420, 420 do
		for x = 0, 1800, 300 do
			sprit[#sprit + 1] = lg.newQuad(x, y, 300, 420, sheet:getDimensions())
		end
	end

	typelist = init_dudes()
	bg = lg.newImage("background.png")
	blood = {
		lg.newImage("blood1.png"),
		lg.newImage("blood2.png"),
		lg.newImage("blood3.png")
	}

	queue = {}
	for i = 1, 13 do
		push()
	end
	c = 2
end

function drawcombo()
	x = W/2 + 20
	y = H/2 - 40
	for _, val in ipairs(queue[1]) do
		if _ >= c then
			lg.draw(text[val], x, y)
			y = y - 20
		end
	end
end

function drawqueue()
	local x = W/2 - 50
	local y = 165
	local pos = {
		{860, 300, -math.pi/2, -0.3, 0.3},
		{1010, 328, 0, 0.3},
		{1060, 400, 0, 0.3},
		{1110, 475, 0, 0.3},
		{1160, 550, 0, 0.3},
		{1210, 620, 0, 0.3},
		{1260, 674, 0, 0.3},
		{1360, 720, 0, 0.3},
		{1460, 720, 0, 0.3},
		{1560, 720, 0, 0.3},
		{1660, 720, 0, 0.3},
		{1760, 720, 0, 0.3},
		{1860, 720, 0, 0.3},
	}

	for i, val in ipairs(queue) do
		lg.draw(sheet, val:get("sheet").quads, unpack(pos[i]))
	end
end

function gGame:draw()
	lg.draw(bg)
	drawcombo()
	drawqueue()
end


function gGame:update(dt)

end
