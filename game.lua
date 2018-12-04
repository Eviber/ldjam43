local TLfres = require "tlfres"
local Gamestate = require "hump.gamestate"
local lg = love.graphics
local isDown = love.keyboard.isDown
local World = require "world"
local Component = require "component"
local System = require "system"
local coms = require "common_components"
local dudes = require "dudes"
local sfx = require "sfx"
local vfx = require "vfx"

last_key = {}


local buttonfont = lg.newFont("saru.ttf", 70)
local manager

function push()
	local t1 = {sheep_type, pig_type, woman_type, man_type}
	local t2 = {sheep_type, pig_type, woman_type, man_type, tall_man_type, big_man_type}
	local t3 = {sheep_type, pig_type, woman_type, man_type, tall_man_type, big_man_type, chicken_type}
	local t4 = {sheep_type, pig_type, woman_type, man_type, tall_man_type, big_man_type, chicken_type, woman_type_2, man_type_2}
	local t5 = {sheep_type, pig_type, woman_type, man_type, tall_man_type, big_man_type, chicken_type, woman_type_2, man_type_2, cat_type, old_man_type}
	local t6 = {sheep_type, pig_type, woman_type, man_type, tall_man_type, big_man_type, chicken_type, woman_type_2, man_type_2, cat_type, old_man_type, buff_man_type}
	local t7 = {sheep_type, pig_type, woman_type, man_type, tall_man_type, big_man_type, chicken_type, woman_type_2, man_type_2, cat_type, old_man_type, buff_man_type, king_man_type}
	local days_tab = {t1, t2, t3, t4, t5, t6, t7}
	--table.insert(queue, dudes[math.random(#dudes)])
	--print (World:assemble(typelist[math.random(#typelist)]))
	table.insert(queue, World:assemble(days_tab[day][math.random(#(days_tab[day]))]))
	--print (queue[#queue].value)
end

function pop()
	table.remove(queue, 1)
	push()
end

function gGame:init()
	queue = {}
	for i = 1, 13 do
		push()
		--print(queue[i].id)
	end
	c = 2
	lastinput = 0
	World:register(new_combo_line_manager())
	manager = World:create()
	manager:add(new_combo())
	manager:add(coms.new_sprite(key_sheet, key_sprit))
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
	local pos = {
		{860, 540, -math.pi/2, -0.3, 0.3},
		{1050, 570, 0, 0.3},
		{1130, 643, 0, 0.3},
		{1210, 713, 0, 0.3},
		{1290, 785, 0, 0.3},
		{1370, 855, 0, 0.3},
		{1450, 916, 0, 0.3},
		{1530, 977, 0, 0.3},
		{1610, 1038, 0, 0.3},
		{1690, 1099, 0, 0.3},
		{1770, 1160, 0, 0.3},
		{1850, 1221, 0, 0.3},
		{1930, 1282, 0, 0.3},
	}

	for i, val in ipairs(queue) do
		lg.draw(val:get("sprite").sheet, val:get("sprite").quads, unpack(pos[i]))
	end
end

function drawpriest()
	lg.draw(shaman, pose, 835, 415, 0, 0.3)
end

function gGame:draw()
	TLfres.beginRendering(1920, 1080)
	lg.draw(bg)
	if curblood then lg.draw(curblood) end
	drawpriest()
	drawcombo()
	drawqueue()
	World:draw()
	lg.setFont(buttonfont)
	lg.print({{51/255,51/255,51/255}, string.format("%08d", score)}, 20, 10)
	lg.print({{51/255,51/255,51/255}, string.format("%02d", math.ceil(timer))}, 1780, 10)
	vfx.draw()
	TLfres.endRendering({0,0,0,0})
end


function gGame:keypressed(key, scancode, isrepeat)
	if scancode == "up" then
		pose = poses[2]
		lastinput = love.timer.getTime()
	elseif scancode == "down" then
		pose = poses[3]
		lastinput = love.timer.getTime()
	elseif scancode == "right" then
		pose = poses[4]
		lastinput = love.timer.getTime()
	elseif scancode == "left" then
		pose = poses[5]
		lastinput = love.timer.getTime()
	end
	if scancode == "up" or scancode == "down" or scancode == "left" or scancode == "right" then
		table.insert(last_key, scancode)
	end
	
	--[[if scancode == queue[1][c] then
		c = c + 1
		if c > #queue[1] then
			c = 2
			pop()
		end
	end]]
end

function gGame:update(dt)
	vfx.update(dt)
	if not isDown("up", "down", "left", "right") then
		pose = poses[1]
	end
	timer = timer - dt
	if timer <= 0 then
		if day < 7 then
			print(string.format("%d points on day %d", score, day))
			if score >= threshold[day] then
				day = day + 1
				manager.remove = true
			end
			timer = 30
			score = 0
			Gamestate.switch(gTransition)
		else
			Gamestate.switch(gMenu)
		end
	end
	if score >= threshold[day] then
		curblood = blood[3]
	elseif score >= threshold[day] * 2 / 3 then
		curblood = blood[2]
	elseif score >= threshold[day] * 1 / 3 then
		curblood = blood[1]
	end
end

function gGame:enter()
	for i = 1, 13 do
		pop()
	end
	--manager:get("keys").line = queue[1]:get("combo").template
	--manager:get("keys").size = #queue[1]:get("combo").template
	--manager:get("keys").cursor = 1
end

