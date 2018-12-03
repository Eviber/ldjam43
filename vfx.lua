local lg = love.graphics

p = {}

vfx = {}

function vfx.load()
	hemo = lg.newParticleSystem(love.graphics.newImage('hemo.png'))
	hemo:setParticleLifetime(0.3)
	hemo:setSizes(0.15)
	--hemo:setLinearAcceleration(10000, 0, -10000, -10000)
	hemo:setRadialAcceleration(1000)
	hemo:setSizeVariation(0)
	hemo:setPosition(1920/2 - 20, 1080/2 + 50)
	hemo:setEmissionArea("ellipse", 30, 30)
	hemo:setEmitterLifetime(0.2)
	hemo:setEmissionRate(10000)
	hemo:setDirection(-math.pi/2)
	hemo:stop()

--[[
	void = lg.newParticleSystem(love.graphics.newImage('pixel.png'))
	void:setParticleLifetime(2)
	void:setSizes(tileDim/2)
	void:setLinearAcceleration(tileDim * 10/8, tileDim * 10/8, -tileDim * 10/8, -tileDim * 10/8)
	void:setPosition(W/2, H/2)
	void:setEmissionArea("normal", W/2, H/2)
	void:setEmissionRate(150)

	blur = lg.newParticleSystem(love.graphics.newImage('pixel.png'))
	blur:setParticleLifetime(2)
	blur:setSizes(0, tileDim)
	blur:setPosition(W/2, H/2)
	blur:setRadialAcceleration(0, tileDim * 70)
	blur:setLinearDamping(1)
	blur:setEmissionArea("borderellipse", 1, 1)
	blur:setEmissionRate(500)
	blur:stop()
]]
end

function vfx.update(dt)
	hemo:update(dt)
end

--[[
	smoke:setEmissionRate(10 * speed)
	screen:update(dt)
	smoke:update(dt)
	void:update(dt)
--	blur:setParticleLifetime(1.75 * transiRad / diag)
--	blur:setEmissionArea("borderellipse", transiRad, transiRad)
	blur:update(dt)
	do
		local i = transition and 0 or 2
		local r, g, b = getColor(colorTab[(iter.id + i) % 3 + 1], False)
		void:setColors(r, g, b, 1, r, g, b, 0)
		smoke:setColors(r, g, b, 1, r, g, b, 0)
		r, g, b = getColor(colorTab[(iter.id + i + 1) % 3 + 1], False)
		blur:setColors(r, g, b, 1, r, g, b, 1, r, g, b, 1, r, g, b, 1, r, g, b, 1, r, g, b, 1, r, g, b, 1, r, g, b, 0)
	end
	for _, psys in pairs(p) do
		psys:update(dt)
	end
	smoke:moveTo(Player.x, Player.y)
end
]]

function vfx.draw()
	lg.setColor(1,1,1,1)
	lg.draw(hemo)
--[[
	for _, psys in pairs(p) do
		lg.draw(psys)
	end
]]
end

return vfx
