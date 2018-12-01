local lg = love.graphics

local isDown = love.keyboard.isDown

local verbs = {"up", "down", "left", "right"}

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

function love.load()
	W, H = lg.getWidth(), lg.getHeight()
	font = lg.newFont("roboto.ttf")
	text = {
		up = lg.newText(font, "up"),
		down = lg.newText(font, "down"),
		left = lg.newText(font, "left"),
		right = lg.newText(font, "right")
	}
	sprit = {
		lg.newImage("dude.png"),
		lg.newText(font, "A"),
		lg.newText(font, "Y"),
		lg.newText(font, "H")
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
	x = W/2
	y = H/2
	for _, val in ipairs(queue) do
		lg.draw(sprit[val[1]], x, y)
		x = x + 20
		y = y + 20
	end
end

function love.draw()
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

function love.update(dt)
	getInput()
end
