if(keyboard_check_pressed(vk_enter)){
	room_goto(rm_menu);
	audio_pause_all();
}

// Mudando de mundo se apertar espaço
if(keyboard_check_pressed(vk_space)){
	global.current_area = !global.current_area;
	
	// Definindo qual o Y da hud com base no mundo
	with(obj_hud){
		// Se for o mundo dos vivos, o Y é 10
		// Se não for o mundo dos vivos, então o Y é -10
		hud_y += (global.current_area == 0) ? 10 : -10
	}
}

#region Game State

// Se o estado do jogo for "jogando"
if(game_state == "playing"){
	// Se o timer do dia for maior que 0
	if(day_timer > 0){
		// O timer diminui em 1 a cada frame
		day_timer--;
		
	// Caso o timer não seja maior que 0
	}else{
		// O estado do jogo se torna "finalizado"
		game_state = "finished"
		
		// Se existe uma intancia do obj_spawner
		if(instance_exists(obj_spawner)){
			// Então ela é destruida
			instance_destroy(obj_spawner);
		}
		
		// No obj_customer 
		with(obj_customer){
			// O estado é definido para "saindo"
			state = "leaving";
		}
		
		// Se a pontuação atual for maior ou igual a meta
		if(global.current_score >= global.daily_quota){
			// O resultado do dia é vitoria
			day_result = "win";
			audio_play_sound(snd_win, 5, 0);
			show_debug_message("Vitória! Meta atingida")
		
		// Caso a pontuação não seja maior ou igual a meta
		}else{
			// O resultado do dia é derrota
			day_result = "lose";
			audio_play_sound(snd_lose, 5, 0)
			show_debug_message("Derrota! Meta não atingida")
		}
	}

// Caso o estado do jogo seja "finalizado"
}else if(game_state == "finished"){
	// Ao apertar espaço
	if(keyboard_check_pressed(vk_enter)){
		// Se o resultado do dia for vitoria
		if(day_result == "win"){
			// Aumentar dia, quota e clientes maximos
			game_restart();	// Jogo recomeça

		// Caso o resultado não seja vitoria
		}else{
			// Fazer animação de derrota
			game_restart();	// Jogo recomeça
		}
	}
}

#endregion