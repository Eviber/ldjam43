local lg = love.graphics

local function gaussian (mean, variance)
	return  math.sqrt(-2 * variance * math.log(math.random())) *
		math.cos(2 * math.pi * math.random()) + mean
end

local function createcloudline(w, h)
	local hh = h/2
	local cloudline = {
		w = w,
		h = h,
		c1 = {
			x = hh,
			y = hh,
			r = hh,
		},
		c2 = {
			x = w - hh,
			y = hh,
			r = hh,
		},
		r = {
			x = hh,
			y = 0,
			w = w - h,
			h = h,
		},
	}
	return (cloudline)
end

local function drawcloud(cloud)
	local x = 0
	local y = 0

	assert(type(cloud) == "table")
	lg.setColor(1,1,1,1)
	for _, line in pairs(cloud.lines) do
		if type(line) == "table" then
			x = cloud.w/2 - line.w/2 + math.random(-(cloud.w/2-line.w/2), cloud.w-line.w-(cloud.w/2-line.w/2))
			lg.circle("fill", line.c1.x+x, line.c1.y+y, line.c1.r)
			lg.circle("fill", line.c2.x+x, line.c2.y+y, line.c2.r)
			lg.rectangle("fill", line.r.x+x, line.r.y+y, line.r.w, line.r.h)
			y = y + line.r.h - math.random(10, 25)
		end
	end
end

function newcloudinfo()
	local cloud = {}
	local diff = 0

	while diff < 65 do
		local lines = math.random(2,4)

		cloud.w = 0
		cloud.h = 0
		cloud.lines = {}
		for i = 1, lines do
			local maxw = 500/2+500/2*i/lines
			local w = math.random(200,maxw)
			while i > 1 and w < cloud.lines[i-1].w and i < lines do
				w = math.random(200, maxw)
			end
			local h = 50
			cloud.lines[i] = createcloudline(w, h)
			if w > cloud.w then
				cloud.w = w
			end
			cloud.h = cloud.h + h
		end
		diff = 0
		for i=1, lines do
			if i ~= 1 then
				diff = diff + math.abs(cloud.lines[i].w - cloud.lines[i-1].w)
			end
		end
		diff = diff / (lines - 1)
	end
	return cloud
end

return {
	new = function ()
		local cloud = newcloudinfo()
		tempcanvas = lg.newCanvas(cloud.w, cloud.h)
		cloud.canvas = lg.newCanvas(cloud.w, cloud.h)

		lg.setCanvas(tempcanvas)
			lg.clear()
			drawcloud(cloud)
		lg.setCanvas(cloud.canvas)
			lg.clear()
			lg.setColor(1,1,1,0.9)
			lg.draw(tempcanvas)
		lg.setCanvas()
		lg.setColor(1,1,1,1)

		cloud.y = math.random(0, H/2)
		cloud.vel = gaussian(100, 50) * (math.random(0,1) == 0 and -1 or 1)
		if cloud.vel >= 0 then
			cloud.x = 0 - cloud.w
		else
			cloud.x = W
		end
		return cloud
	end,

	load = function ()
		math.randomseed(os.time())
		W, H = lg.getWidth(), lg.getHeight()
		cloud = newcloud()
	end,

	update = function (clouds, dt)
		for i = #clouds, 1, -1 do
			local cloud = clouds[i]
			cloud.x = cloud.x + cloud.vel * dt
			if (cloud.vel >= 0 and cloud.x > W) or (cloud.vel <= 0 and cloud.x + cloud.w < 0) then
				table.remove(clouds, i)
			end
		end
	end
}

--[[
local function love.draw()
	lg.setColor(1, 1, 1, 1)
	lg.clear(0,0,0.2,1)
	lg.setColor(1, 1, 1, 0.5)
	lg.draw(cloud.canvas, W/2-cloud.w/2, H/2-cloud.h/2)
end

function love.keypressed(key)
	if key == 'space' then
		cloud = newcloud()
	end
end
]]
