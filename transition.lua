local Gamestate = require "hump.gamestate"
local TLfres = require "tlfres"
local lg = love.graphics

function gTransition:draw()
	TLfres.beginRendering(1920, 1080)

	lg.clear(0, 0, 0)
	lg.draw(bg.nsky)
	lg.draw(bg.moon, 1481, moony)
	lg.draw(bg.nighthill1)
	lg.draw(bg.nighthill2)
	if clouds then
		for _, cloud in ipairs(clouds) do lg.draw(cloud.canvas, cloud.x, cloud.y) end
	end
	lg.draw(bg.pyra)
	lg.draw(bg.score)
	if ready and not set then
		lg.draw(bg.space)
	end

	lg.setFont(menufont)
	lg.print(string.format("%d", day), 1110, 250)
	lg.setFont(buttonfont)
	lg.print(string.format("%d", threshold[day]), 860, 500)

	if not fromMenu then
		lg.draw(bg.scoretxt, 160, 77)
		lg.setFont(menufont)
		lg.printf(string.format("%08d", score), scoreval.x, scoreval.y, W, "center", 0, scoreval.scale)
	end

	TLfres.endRendering({0,0,0,0})
end

function gTransition:keypressed(key, scancode)
	if ready and scancode == "space" then
		set = true
	end
end

function gTransition:update(dt)
	if moony > 89 and not set then
		moony = moony - 800 * dt
		if moony <= 89 then
			moony = 89
			ready = true
		end
	elseif set and moony < H/2+65 then
		moony = moony + 800 * dt
		if moony >= H/2+65 then
			moony = H/2+65
			ready = false
			set = false
			Gamestate.switch(gGame)
		end
	end
end

function gTransition:enter()
	if not moony then
		moony = H/2+65
	end
end
