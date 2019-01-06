local Gamestate = require "hump.gamestate"
local TLfres = require "tlfres"
local lg = love.graphics

local timer = 0


function gTransition:draw()
	TLfres.beginRendering(1920, 1080)
	local W = 960
	local H = 540
	
	lg.draw(bg.nsky)
	lg.clear(0, 0, 0)
	lg.draw(bg.nsky)
	lg.draw(bg.nighthill1)
	lg.draw(bg.nighthill2)
	--for _, cloud in ipairs(clouds) do lg.draw(cloud.canvas, cloud.x, cloud.y) end
	lg.draw(bg.pyra)
	lg.draw(bg.score)

	--[[
	lg.setFont(menufont)
	lg.print(string.format("DAY %d", day), W-250, H-300)
	lg.setFont(buttonfont)
	lg.print(string.format("REACH %d", threshold[day]), W-320, H)
	lg.print("TO SATISFY THE GODS !", W-700, H+200)
	--]]
	
	TLfres.endRendering({0,0,0,0})
end

function gTransition:update(dt)
	timer = timer + dt
	if timer >= 4 then
		timer = 0
		--print"ohai"
		Gamestate.switch(gGame)
	end
end
