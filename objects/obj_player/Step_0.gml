// Mudando de mundo se apertar espaço
if(keyboard_check_pressed(vk_space)){
	global.current_area = !global.current_area;
	with(obj_hud){
		hud_y += (global.current_area == 0) ? 10 : -10
	}
}

if(game_state == "playing"){
	if(day_timer > 0){
		day_timer--;
	}else{
		game_state = "finished"
		
		if(instance_exists(obj_spawner)){
			instance_destroy(obj_spawner);
		}
		
		with(obj_customer){
			state = "leaving";
		}
		
		if(global.current_score >= global.daily_quota){
			day_result = "win";
			show_debug_message("Vitória! Meta atingida")
		}else{
			day_result = "lose";
			show_debug_message("Derrota! Meta atingida")
		}
	}
}else if(game_state == "finished"){
	if(keyboard_check_pressed(vk_enter)){
		if(day_result == "win"){
			// Aumentar dia, quota e clientes maximos
			game_restart();
		}else{
			// Derrota
			game_restart();
		}
	}
}