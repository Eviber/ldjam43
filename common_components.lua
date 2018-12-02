local Component = require "component"

return{
	
	new_body = function(x, y)
		local body = Component.new "body"
		body.x = x
		body.y = y
		return body
	end,


	new_rectangle_component = function()
		return Component.new "rect"
	end,
	
	new_value = function(points)
		local value = Component.new "value"
		value.points = points
		return value
	end,
	
	new_combo_template = function(template)
		local combo = Component.new "combo"
		combo.template = template
		return combo
	end,
	
	new_sprite = function(quads)
		local sheet = Component.new "sheet"
		sheet.quads = quads
		return sheet
	end
	
}