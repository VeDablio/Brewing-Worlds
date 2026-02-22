if(array_length(mixer_contents) == max_ingredients && mixer_state = "waiting"){
	mixer_state = "shaking";
};

if(mixer_state == "shaking"){
	x = mouse_x;
	y = mouse_y;
	
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