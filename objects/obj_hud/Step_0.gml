if(global.current_area == 0){
	hud_y			= 0;
	sprite_index	= spr_hud_living;
}else{
	hud_y			= gui_height - hud_height;
	sprite_index	= spr_hud_dead;
}