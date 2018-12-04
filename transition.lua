local Gamestate = require "hump.gamestate"
local TLfres = require "tlfres"
local lg = love.graphics

local timer = 0


function gTransition:draw()
	TLfres.beginRendering(1920, 1080)
	local W = 960
	local H = 540
	
	lg.setFont(menufont)
	lg.print(string.format("DAY %d", day), W-250, H-300)
	lg.setFont(buttonfont)
	lg.print(string.format("REACH %d", threshold[day]), W-320, H)
	lg.print("TO SATISFY THE GODS !", W-700, H+200)
	
	TLfres.endRendering({0,0,0,0})
end

function gTransition:update(dt)
	timer = timer + dt
	if timer >= 4 then
		timer = 0
		Gamestate.switch(gGame)
	end
end
