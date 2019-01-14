local Gamestate = require "hump.gamestate" local TLfres = require "tlfres"
local lg = love.graphics
local World = require "world"

local nscore
local t
local maxt = 0.5

function gScore:draw()
	TLfres.beginRendering(1920, 1080)

	lg.draw(bg.nsky)
	lg.draw(bg.moon, 1481, moony)
	lg.draw(bg.nighthill1)
	lg.draw(bg.nighthill2)
	if clouds then
		for _, cloud in ipairs(clouds) do lg.draw(cloud.canvas, cloud.x, cloud.y) end
	end
	lg.draw(bg.pyra)
	drawpriest()
	drawqueue()

	lg.draw(bg.scoretxt, 160, 77)

	lg.setFont(menufont)
	lg.printf(string.format("%08d", math.floor(nscore)), scoreval.x, scoreval.y, W, "center", 0, scoreval.scale)

	TLfres.endRendering({0,0,0,0})
end

function gScore:keypressed(key, scancode)
	if scancode == "space" then
		if nscore < score then
			nscore = score
		else
			t = maxt
		end
	end
end

function gScore:update(dt)
	if moony > 89 then
		moony = moony - 800 * dt
		if moony < 89 then
			moony = 89
			ready = true
		end
	end
	if nscore < score then
		local multi = (score - nscore) * 2
		if multi < 1 then multi = 1 end
		nscore = nscore + dt * multi
		if nscore > score then
			nscore = score
		end
	else
		t = t + dt
		if t >= 0 and t < maxt then
			scoreval.x = -30 * t / maxt
			scoreval.y = H/2-100 - ((H/2-100 - 35) * t / maxt)
			scoreval.scale = 1 - ((1 - 0.8) * t / maxt)
		elseif t >= maxt then
			scoreval.x = -30
			scoreval.y = 35
			scoreval.scale = 0.8
			Gamestate.switch(gTransition)
		end
	end
end

function gScore:enter()
	nscore = 0
	t = -0.5

	scoreval = {
		scale = 1,
		x = 0,
		y = H/2-100,
	}
end
