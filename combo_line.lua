local Component = require "component"
local System = require "system"
local World = require "world"

--local cursor = 1

local key_tab = {"up", "down", "left", "right"}


function new_combo()
	local combo_line = Component.new "keys"
	combo_line.line = queue[1]:get("combo").template
	for i, val in ipairs(combo_line.line) do
		if val == "wild" then
			val = key_tab[math.random(#key_tab)]
		end
	end
	combo_line.cursor = 1
	return combo_line
end

function new_combo_line_manager()
	local manager = System.new {"keys"}
	
	function manager:update(dt, entity)
		local keys = entity:get("keys")
		--print(dt, entity)
		for i, val in ipairs(last_key) do
			if keys.cursor <= #queue[1]:get("combo").template then
				if val == keys.line[keys.cursor] or keys.line[keys.cursor] == "any" then
					keys.cursor = keys.cursor + 1
				else
					keys.cursor = 1
				end
			end
			if keys.cursor > #queue[1]:get("combo").template then
				--go kaboom
				--points go up
				pop()
				--entity.remove = true
				--local new = World:create()
				--new:add(new_combo())
				keys.line = queue[1]:get("combo").template
				keys.cursor = 1
			end
		end
		last_key = {}
	end
	return manager
end

