local coms = require "common_components"

function init_dudes()
	woman_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 100},
		{coms.new_combo_template, {"up", "down"}},
		{coms.new_sprite, sprit[1]}
		
	}
	
	man_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 100},
		{coms.new_combo_template, {"down", "up"}},
		{coms.new_sprite, sprit[2]}
	}
	
	tall_man_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 100},
		{coms.new_combo_template, {"up", "up", "up", "wild"}},
		{coms.new_sprite, sprit[3]}
	}
	
	big_man_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 100},
		{coms.new_combo_template, {"left", "right", "left", "right"}},
		{coms.new_sprite, sprit[4]}
	}
	
	woman_type_2 = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 200},
		{coms.new_combo_template, {"up", "down", "wild"}},
		{coms.new_sprite, sprit[5]}
	}
	
	man_type_2 = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 200},
		{coms.new_combo_template, {"down", "up", "wild"}},
		{coms.new_sprite, sprit[6]}
	}
	
	old_man_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 300},
		{coms.new_combo_template, {"up", "up", "wild", "down", "down"}},
		{coms.new_sprite, sprit[7]}
	}
	
	pig_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 100},
		{coms.new_combo_template, {"left", "up"}},
		{coms.new_sprite, sprit[8]}
	}
	
	sheep_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 100},
		{coms.new_combo_template, {"down", "right"}},
		{coms.new_sprite, sprit[9]}
	}
	
	chicken_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 50},
		{coms.new_combo_template, {"any"}},
		{coms.new_sprite, sprit[10]}
	}
	
	cat_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 1000},
		{coms.new_combo_template, {"wild","wild","wild","wild","wild","wild","wild","wild","wild"}},
		{coms.new_sprite, sprit[11]}
	}
	
	buff_man_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 300},
		{coms.new_combo_template, {"left", "right", "up", "down", "wild"}},
		{coms.new_sprite, sprit[12]}
	}
	
	superman_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 300},
		{coms.new_combo_template, {"any"}},
		{coms.new_sprite, sprit[13]}
	}
	
	buff_man_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 300},
		{coms.new_combo_template, {"up", "down","left", "right", "up", "down","left", "right"}},
		{coms.new_sprite, sprit[14]}
	}
	
	return {woman_type, man_type, tall_man_type, big_man_type, woman_type_2, man_type_2, old_man_type, pig_type, sheep_type, chicken_type, cat_type, buff_man_type, superman_type, king_man_type}
end
