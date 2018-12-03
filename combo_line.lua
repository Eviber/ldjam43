local Component = require "component"
local System = require "system"
local World = require "world"

local lg = love.graphics

local key_tab = {"up", "down", "left", "right"}


function new_combo()
	local combo_line = Component.new "keys"
	combo_line.line = queue[1]:get("combo").template
	combo_line.size = #queue[1]:get("combo").template
	combo_line.cursor = 1
	return combo_line
end

function new_combo_line_manager()
	local manager = System.new {"keys"}

	function manager:update(dt, entity)
		local keys = entity:get("keys")
		for i, val in ipairs(last_key) do
			if keys.cursor <= keys.size then
				if val == keys.line[keys.cursor] or keys.line[keys.cursor] == "any" then
					keys.cursor = keys.cursor + 1
					sfx.shaman[val]:clone():play()
				else
					keys.cursor = 1
					sfx.shaman.hm:clone():play()
				end
			end
			if keys.cursor > keys.size then
				--go kaboom
				score = score + queue[1]:get("value").points
				sfx.kill[math.random(#sfx.kill)]:clone():play()
				pop()
				keys.line = queue[1]:get("combo").template
				keys.size = #queue[1]:get("combo").template
				keys.cursor = 1
			end
		end
		last_key = {}
	end

	function manager:draw(entity)
		local sheet = entity:get("sprite").sheet
		local quads = entity:get("sprite").quads
		local keys = entity:get("keys")
		local line = entity:get("keys").line
		local corres = {
			up = 1,
			down = 2,
			left = 3,
			right = 4,
			any = 5,
		}

		local x = 1000
		local y = 400
		lg.draw(sheet, quads[corres[line[keys.cursor]]], x, y, 0, 1)
		x = x + 35
		y = y - 70
		for i = 1, keys.size - keys.cursor do
			lg.draw(sheet, quads[corres[line[i + keys.cursor]]], x, y, 0, 0.5)
			y = y - 70
		end
	end
	return manager
end

