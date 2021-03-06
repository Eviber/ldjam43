local Gamestate = require "hump.gamestate"

gGame = {}
gMenu = {}
gCredits = {}
gTransition = {}
gScore = {}
score = 0
day = 1
timer = 30
threshold = {1200, 1800, 2500, 3500, 4700, 6000, 7500}

require "menu"
require "game"
require "drawscore"
require "combo_line"
require "sfx"

local World = require "world"
local Component = require "component"
local System = require "system"
local coms = require "common_components"

local lg = love.graphics
local isDown = love.keyboard.isDown



--[[function new_combo_manager_system()
	local manager = System:new {"combo"}
	function manager:draw(entity)
		local combo = entity:get "combo"
		
	end
	
end]]

function loadassets()
	shaman = lg.newImage("shaman.png")
	poses = {}
	for x = 0, 4550, 650 do
		poses[#poses + 1] = lg.newQuad(x, 0, 650, 650, shaman:getDimensions())
	end
	pose = poses[1]

	sheet = lg.newImage("dudes.png")
	sprit = {}
	for y = 0, 420, 420 do
		for x = 0, 1800, 300 do
			sprit[#sprit + 1] = lg.newQuad(x, y, 300, 420, sheet:getDimensions())
		end
	end
	key_sheet = lg.newImage("keys.png")
	key_sprit = {}
	for x = 0, 153*5, 153 do
		key_sprit[#key_sprit + 1] = lg.newQuad(x, 0, 153, 138, key_sheet:getDimensions())
	end

	typelist = init_dudes()

	bg = {
		hill1      = lg.newImage("assets/art/hill1.png"),
		hill2      = lg.newImage("assets/art/hill2.png"),
		duskhill1  = lg.newImage("assets/art/duskhill1.png"),
		duskhill2  = lg.newImage("assets/art/duskhill2.png"),
		nighthill1 = lg.newImage("assets/art/nighthill1.png"),
		nighthill2 = lg.newImage("assets/art/nighthill2.png"),
		pyra       = lg.newImage("assets/art/pyramid.png"),
		nsky       = lg.newImage("assets/art/nightsky.png"),
		moon       = lg.newImage("assets/art/moon.png"),
		score      = lg.newImage("assets/art/score.png"),
		scoretxt   = lg.newImage("assets/art/scoretxt.png"),
		space      = lg.newImage("assets/art/space.png"),
		bords      = lg.newImage("assets/art/bord.png"),
	}
	blood = {
		lg.newImage("assets/art/blood1.png"),
		lg.newImage("assets/art/blood2.png"),
		lg.newImage("assets/art/blood3.png")
	}
	
	twitter = lg.newImage("icon_twitter.png")
	instagram = lg.newImage("icon_insta.png")
end

function love.load()
	math.randomseed(os.time())
	love.mouse.setVisible(false)
	love.keyboard.setKeyRepeat(false)
	Gamestate.registerEvents()
	W, H = lg.getWidth(), lg.getHeight()
	sfx.load()
	vfx.load()
	menufont = lg.newFont("aztecways.ttf", 200)
	buttonfont = lg.newFont("aztecways.ttf", 120)
	font = lg.newFont("roboto.ttf", 70)

	loadassets()

	Gamestate.switch(gMenu)


	--World:register(new_renderer_system())
	
	--[[local entity = World:create()
	entity:madd(coms.new_body(100,100))
		  :madd(coms.new_rectangle_component())
	--local entity2 = World:create()
	--entity2:add (new_body(100,200))
	--entity2:add(new_rectangle_component())
	
	local test = World:assemble{
		{coms.new_body, 100, 300},
		{coms.new_rectangle_component}
	}]]
	--for i, val in ipairs(queue[1]) do print (val) end
end


function love.update(dt)
	World:update(dt)
end
