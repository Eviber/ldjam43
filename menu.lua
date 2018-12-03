local Gamestate = require "hump.gamestate"
local TLfres = require "tlfres"
local lg = love.graphics
local credits = require "credits"

local selected

function gMenu:init()
	lg.setFont(menufont)
	selected = "Play"
end


function gMenu:update(dt)
	
end

function gMenu:draw()
	TLfres.beginRendering(1920, 1080)
	local W = 960
	local H = 540
	local key_sheet = lg.newImage("keys.png")
	local arrow = key_sprit[4]
	
	lg.setFont(menufont)
	lg.print("Dance Dance", W - 370, H - 500)
	lg.print("SACRIFICES", W - 650, H - 300)

	lg.print("Play", W - 150, H - 50)
	lg.print("Credits", W - 230, H + 150)
	
	local tmp = (selected == "Play" and {W-400, H-40} or {W-480, H+150})
	lg.draw(key_sheet, arrow, unpack(tmp))
	
	TLfres.endRendering({0,0,0,0})
end


function gMenu:keypressed(key, scancode, isrepeat)
	if scancode == 'return' and selected == "Play" then
		score = 0
		Gamestate.switch(gGame)
	elseif scancode == 'return' and selected == "Credits" then
		Gamestate.switch(gCredits)
	elseif scancode == 'escape' then
		love.event.quit()
	elseif scancode == 'up' or scancode == 'down' then
		selected = (selected == "Play" and "Credits" or "Play")
	end
end
