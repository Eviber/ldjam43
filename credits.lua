local Gamestate = require "hump.gamestate"
local TLfres = require "tlfres"
local lg = love.graphics

function gCredits:init()
	lg.setFont(menufont)
end

function gCredits:draw()
	TLfres.beginRendering(1920, 1080)
	local W = 960
	local H = 540
	local key_sheet = lg.newImage("keys.png")
	local arrow = key_sprit[4]
	
	lg.setFont(menufont)
	lg.print("Credits", W - 250, H - 500)
	lg.draw(key_sheet, arrow, W-400, H+350)
	lg.print("Return", W-200, H+330)
	
	local buttonfont = lg.newFont("aztecways.ttf", 130)
	lg.setFont(buttonfont)
	lg.print("  Programming            Art      ", W-830, H-300)
	lg.setFont(font)
	lg.print("   Youva Gaudé            Lola Belloni  ", W-830, H-150)
	lg.print("      @youvadidj        ", W-830, H-50)
	lg.print(" Théo Le Gac-Dufly       @boudoumgredon", W-830, H+50)
	lg.print("      @EHaamu                       ", W-830, H+150)
	lg.draw(twitter, W-700, H-70, 0, 0.11)
	lg.draw(twitter, W-700, H+130, 0, 0.11)
	lg.draw(instagram, W+85, H+30, 0, 0.23)
	

	
	TLfres.endRendering({0,0,0,0})
end

function gCredits:keypressed(key, scancode, isrepeat)
	if scancode == 'return' or scancode == 'escape' then
		Gamestate.switch(gMenu)
	end
end
