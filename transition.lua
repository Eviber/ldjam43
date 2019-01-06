local Gamestate = require "hump.gamestate"
local TLfres = require "tlfres"
local lg = love.graphics

local moony = -265

function gTransition:draw()
	TLfres.beginRendering(1920, 1080)
	local W = 960
	local H = 540
	
	lg.clear(0, 0, 0)
	lg.draw(bg.nsky)
	lg.draw(bg.moon, 1481, moony)
	lg.draw(bg.nighthill1)
	lg.draw(bg.nighthill2)
	--for _, cloud in ipairs(clouds) do lg.draw(cloud.canvas, cloud.x, cloud.y) end
	lg.draw(bg.pyra)
	lg.draw(bg.score)

	lg.setFont(menufont)
	lg.print(string.format("%d", day), W+150, H-290)
	lg.setFont(buttonfont)
	lg.print(string.format("%d", threshold[day]), W-100, H-40)
	
	TLfres.endRendering({0,0,0,0})
end

function gTransition:keypressed(key, scancode)
	if scancode == "space" then
		Gamestate.switch(gGame)
	end
end

function gTransition:update(dt)
	if moony > 89 then
		moony = moony - 1000 * dt
	else
		moony = 89
	end
end

function gTransition:enter()
	moony = H
end
