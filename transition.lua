local Gamestate = require "hump.gamestate"
local TLfres = require "tlfres"
local lg = love.graphics


function gTransition:draw()
	TLfres.beginRendering(1920, 1080)
	local W = 960
	local H = 540
	
	lg.setFont(menufont)
	lg.print(string.format("DAY %d", day), W-250, H-300)
	lg.print("Press any key to continue", W-740, H+100)
	
	TLfres.endRendering({0,0,0,0})
end

function gTransition:keypressed(key, scancode, isrepeat)
	Gamestate.switch(gGame)
end