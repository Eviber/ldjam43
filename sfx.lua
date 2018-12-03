sfx = {}

function sfx.load()
	sfx.shaman = {}
	sfx.shaman.up = love.audio.newSource("assets/audio/Shaman/shaman_up.wav", "static")
	sfx.shaman.down = love.audio.newSource("assets/audio/Shaman/shaman_down.wav", "static")
	sfx.shaman.left = love.audio.newSource("assets/audio/Shaman/shaman_left.wav", "static")
	sfx.shaman.right = love.audio.newSource("assets/audio/Shaman/shaman_right.wav", "static")
	sfx.shaman.hm = love.audio.newSource("assets/audio/Shaman/hm.wav", "static")

	sfx.kill = {}
	for i = 1, 8 do
		sfx.kill[i] = love.audio.newSource("assets/audio/Kill/kill-0" .. tostring(i) .. ".wav", "static")
	end

	--[[
	sfx.realcra = love.audio.newSource("sfx/realcraft.wav", "static")
	sfx.bg = love.audio.newSource("sfx/background.wav", "static")
	sfx.bg:setLooping(true)
	sfx.bg:play()
	sfx[2] = love.audio.newSource("sfx/bom2.wav", "static")
	sfx[2]:setLooping(true)
	sfx[2]:play()
	]]
end

function sfx.update()
	--[[
	sfx[2]:setPitch((math.log(speed + 1.000001) + 1) / 4)
	sfx[2]:setVolume(speed / 10 + 0.1)

	sfx.bg:setVolume(1 - iter.decay / diag)
	]]
end

return sfx
