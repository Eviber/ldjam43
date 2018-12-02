local Component = require "component"


function new_combo()
	local combo_line = Component.new "combo_line"
	combo_line.line = queue[1].combo
	combo_line.cursor = 1
	return combo_line
end

function new_combo_line_manager()
	local manager = System.new {"combo_line"}
	
	function manager:update(entity)
		
	end
end

