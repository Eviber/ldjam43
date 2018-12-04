local coms = require "common_components"
local u = "up"
local d = "down"
local l = "left"
local r = "right"

function init_dudes()
	woman_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 150},
		{coms.new_combo_template, {u,d,u}},
		{coms.new_sprite, sheet, sprit[1]}
		
	}
	
	man_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 150},
		{coms.new_combo_template, {d,u,d}},
		{coms.new_sprite, sheet, sprit[2]}
	}
	
	tall_man_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 200},
		{coms.new_combo_template, {u,u,u,d}},
		{coms.new_sprite, sheet, sprit[3]}
	}
	
	big_man_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 200},
		{coms.new_combo_template, {l,r,l,r}},
		{coms.new_sprite, sheet, sprit[4]}
	}
	
	woman_type_2 = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 250},
		{coms.new_combo_template, {r,l,l,r}},
		{coms.new_sprite, sheet, sprit[5]}
	}
	
	man_type_2 = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 250},
		{coms.new_combo_template, {d,u,u,d}},
		{coms.new_sprite, sheet, sprit[6]}
	}
	
	old_man_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 350},
		{coms.new_combo_template, {u,u,l,l,d,d}},
		{coms.new_sprite, sheet, sprit[7]}
	}
	
	pig_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 100},
		{coms.new_combo_template, {l,u}},
		{coms.new_sprite, sheet, sprit[8]}
	}
	
	sheep_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 100},
		{coms.new_combo_template, {d,r}},
		{coms.new_sprite, sheet, sprit[9]}
	}
	
	chicken_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 50},
		{coms.new_combo_template, {"any"}},
		{coms.new_sprite, sheet, sprit[10]}
	}
	
	cat_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 300},
		{coms.new_combo_template, {d,d,d,d,d,d,d,d,d}},
		{coms.new_sprite, sheet, sprit[11]}
	}
	
	buff_man_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 800},
		{coms.new_combo_template, {l,r,u,d,u,r}},
		{coms.new_sprite, sheet, sprit[12]}
	}
	
	--[[superman_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 300},
		{coms.new_combo_template, {"any"}},
		{coms.new_sprite, sheet, sprit[13]}
	}]]
	
	king_man_type = {
		{coms.new_body, 1860, 720},
		{coms.new_value, 500},
		{coms.new_combo_template, {u,d,l,r,u,d,l,r}},
		{coms.new_sprite, sheet, sprit[14]}
	}
	
	--return {woman_type, man_type, tall_man_type, big_man_type, woman_type_2, man_type_2, old_man_type, pig_type, sheep_type, chicken_type, cat_type, buff_man_type, --[[superman_type,]] king_man_type}
	return{chicken_type, sheep_type, pig_type, woman_type, man_type, woman_type_2, man_type_2, cat_type, old_man_type, tall_man_type, big_man_type, buff_man_type, king_man_type}
end
