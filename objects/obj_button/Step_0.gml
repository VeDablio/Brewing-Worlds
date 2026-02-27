var _hover = position_meeting(mouse_x, mouse_y, id);

if(_hover){
	target_scale	= 1.1;
	window_set_cursor(cr_handpoint);
	
	if(mouse_check_button_pressed(mb_left)){
		if(action == "play"){
			room_goto(rm_game);
		}else if(action == "tutorial"){
			room_goto(rm_tutorial);
		}
	}
}else{
	target_scale	= 1;
}

image_xscale	= lerp(image_xscale, target_scale, .2);
image_yscale	= lerp(image_yscale, target_scale, .2);