local Gamestate = require "hump.gamestate"
local lg = love.graphics
local isDown = love.keyboard.isDown

gGame = {}

local dudes = {
	{1, "up", "down"},
	{2, "down", "down"},
	{3, "left", "down"},
	{4, "right", "up"}
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
	sheet = lg.newImage("dudes.png")
	sprit = {}

	for y = 0, 420, 420 do
		for x = 0, 1800, 300 do
			print(x, y)
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
	for i = 1, 10 do
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
	x = W/2 - 50
	y = 165
	for _, val in ipairs(queue) do
		if _ == 1 then
			lg.draw(sheet, sprit[val[1]], x-100, y + 100, -math.pi/2, -0.5, 0.5)
		else
			lg.draw(sheet, sprit[val[1]], x, y, 0, 0.5)
		end
		x = x + 500
		y = y + 400
	end
end

function gGame:draw()
	lg.draw(bg)
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
