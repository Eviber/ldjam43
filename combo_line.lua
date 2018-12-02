local Component = require "component"

return {
	function new_combo()
		local combo_line = Component.new "combo_line"
		combo_line.line = queue[1].combo
		combo_line.cursor = 1
		return combo_line
	end
	
	combo_line_type = {
		{new_combo}
	}
}
