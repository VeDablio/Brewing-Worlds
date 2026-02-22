draw_self();

if(mixer_state == "shaking"){
	var _bar_w	= 64;
	var _bar_h	= 10;
	var _x1		= x - (_bar_w / 2);
	var _y1		= y - 80;
	
	draw_set_colour(c_black);
	draw_rectangle(_x1, _y1, _x1 + _bar_w, _y1 + _bar_h, false);
	
	var _color = (global.current_area == 0) ? c_lime : c_purple;
	draw_set_colour(_color);
	var _fill_width = (shake_progress / shake_target) * _bar_w;
	draw_rectangle(_x1, _y1, _x1 + _fill_width, _y1 + _bar_h, false);
	
	draw_set_colour(c_white);
}