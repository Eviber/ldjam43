local Component = require "component"
local System = require "system"
local World = require "world"

local key_tab = {"up", "down", "left", "right"}


function new_combo()
	local combo_line = Component.new "combo_line"
	combo_line.line = queue[1]:get("combo")
	for i, val in ipairs(combo_line.line) do
		if val == "wild" then
			val = key_tab[math.random(#key_tab)]
		end
	end
	combo_line.cursor = 1
	return combo_line
end

function new_combo_line_manager()
	local manager = System.new {"combo_line"}
	
	function manager:update(dt, entity)
		print(dt, entity)
		if entity.cursor > #queue[1]:get("combo").template then
			--go kaboom
			--points go up
			pop()
			entity.remove = true
			local manager = World:create()
			manager:add(new_combo())
		else
			for i, val in ipairs(last_key) do
				if val == entity.line[entity.cursor] then
					entity.cursor = entity.cursor + 1
				else
					entity.cursor = 1
				end
			end
			last_key = {}
		end
		
	end
	return manager
end

