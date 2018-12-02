local Gamestate = require "hump.gamestate"
local lg = love.graphics
local isDown = love.keyboard.isDown

gGame = {}

local dudes = {
	{1, "up", "down"},
	{2, "down", "down"},
	{3, "left", "down"},
	{4, "right", "up"},
	{5, "right", "up"},
	{6, "right", "up"},
	{7, "right", "up"},
	{8, "right", "up"},
	{9, "right", "up"},
	{10, "right", "up"},
	{11, "right", "up"},
	{12, "right", "up"},
	{13, "right", "up"},
	{14, "right", "up"},
}

function push()
	table.insert(queue, dudes[math.random(#dudes)])
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
	shaman = lg.newImage("shaman.png")
	sheet = lg.newImage("dudes.png")
	sprit = {}

	for y = 0, 420, 420 do
		for x = 0, 1800, 300 do
			sprit[#sprit + 1] = lg.newQuad(x, y, 300, 420, sheet:getDimensions())
		end
	end

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
		lg.draw(sheet, sprit[val[1]], unpack(pos[i]))
	end
end

function drawpriest()
end

function gGame:draw()
	lg.draw(bg)
	drawpriest()
	drawcombo()
	drawqueue()
end

function getInput()
	if isDown(queue[1][c]) then
		c = c + 1
		if c > #queue[1] then
			c = 2
			pop()
		end
	end
end

function gGame:update(dt)
	getInput()
end
