if(mixer_state == "waiting"){
	show_debug_message(mixer_contents)
}

if(mixer_state == "shaking"){
	x = device_mouse_x_to_gui(0);
	y = device_mouse_y_to_gui(0);
	
	var _mouse_speed = mouse_x - last_mouse_x;
	
	if(abs(_mouse_speed) > shake_threshold){
		var _current_direction = sign(_mouse_speed)
		
		if(_current_direction != last_direction){
			shake_progress += 5;
			last_direction = _current_direction;
		}
	}
	
	last_mouse_x = mouse_x;
	
	if(shake_progress >= shake_target){
		mixer_state = "finished";
		check_recipe();
	}
}

if(mixer_state == "finished"){
	mixer_contents = [];
	
	if(final_drink == noone){
		mixer_state = "waiting";
	}
}