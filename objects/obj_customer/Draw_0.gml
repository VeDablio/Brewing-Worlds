draw_self()

if(state == "waiting"){
	var _bar_w		= 60;
	var _balloon_y	= y - 100;
	
	draw_sprite(spr_ui_baloon, 0, x, _balloon_y);
	
	if(order_sprite != noone){
		draw_sprite_ext(order_sprite, 0, x, _balloon_y, .5, .5, 0, c_white, 1)
	}
	
    draw_healthbar(x - 30, _balloon_y + 40, x + 30, _balloon_y + 50, (patience_current/patience_max)*100, c_black, c_red, c_green, 0, true, true);
	
	draw_set_colour(c_white);
}