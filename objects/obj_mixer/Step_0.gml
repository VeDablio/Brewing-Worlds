image_xscale = lerp(image_xscale, 1, .2);
image_yscale = lerp(image_yscale, 1, .2);

// Debug para saber se os itens estão entrando corretamente no mixer
if(mixer_state == "waiting"){
	//show_debug_message(mixer_contents)
};

// Se o estado for "shaking" (misturando)
if(mixer_state == "shaking"){
	// Segue a posição X e Y do mouse
	x = mouse_x;
	y = mouse_y;
	
	// Salvando a velocidade do mouse
	var _mouse_speed = mouse_x - last_mouse_x;
	
	// Se a velocidade foi maior que o quanto precisa mexer o mouse
	if(abs(_mouse_speed) > shake_threshold){
		// Criando uma variavel para salvar a direção atual
		var _current_direction = sign(_mouse_speed)
		
		// Direção atual atual for diferente da direção anterior
		if(_current_direction != last_direction){
			// Aumenta o progresso
			shake_progress += 5;
			// Muda qual é a direção anterior
			last_direction = _current_direction;
		}
	}
	
	// Altera qual era o X anterior do mouse
	last_mouse_x = mouse_x;
	
	// Se o progresso for maior ou igual ao quanto ele precisa atingir
	if(shake_progress >= shake_target){
		// O estado do mixerr é "finished" (finalizado)
		mixer_state = "finished";
		
		image_xscale = 1.5;
		image_yscale = 1.5;
		// Verifica qual receita foi feita
		check_recipe();
	}
};

if(mixer_state == "finished"){
	y = home_y;
	if(x >= 640 || x <= 0){
		x = home_x;
	}
}
