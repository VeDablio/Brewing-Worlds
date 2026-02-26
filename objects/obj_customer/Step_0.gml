image_xscale	= lerp(image_xscale, 1, .2);
image_yscale	= lerp(image_yscale, 1, .2);
image_angle		= lerp(image_angle, 1, .2)

#region Máquina de estados

switch(state){
	
	#region Walking
	
	// Caso seja "esperando"
	case "walking":
		// Se o valor positivo do X menos o alvo X for maior que velocidade de movimento
		// Ou seja, se a distancia do X até o alvo X for maior que a velocidade de movimento
		if(abs(x - target_x) > move_spd){
			// Se o X é menor que o alvo X, a velocidade de movimento é positiva
			// Se o X for maior que o alvo X, a velocidade de movimento é negativa
			x += (x < target_x) ? move_spd : -move_spd;
			
		// Caso a distancia de X até o alvo X seja menor que a velocidade de movimento
		// Ou seja, o cliente chegou perto do seu lugar
		}else{
			x = target_x;		// X se torna o alvo x
			state = "ordering";	// O estado se torna "pedindo"
		}
	break;
	
	#endregion
	
	#region Ordering
	
	// Caso seja "pedindo"
	case "ordering":
		select_order();		// Chama a função de escolher pedido
		state = "waiting";	// O estado se torna "esperando"
	break;
	
	#endregion
	
	#region Waiting
	
	// Caso seja "esperando"
	case "waiting":
		// Diminui a paciencia atual
		patience_current--;
		//show_debug_message(order_id);
		
		// Se a paciencia for menor ou igual a 0
		if(patience_current <= 0){
			global.reset_combo();	// Reseta o combo
			state = "leaving";		// O estado se torna "saindo"
		}
	break;
	
	#endregion
	
	#region Leaving
	
	// Caso seja "saindo"
	case "leaving":
		x -= move_spd;	// O cliente se move para a esquerda
		release_slot();	// Libera o lugar que ele estava
		
		// Se ele sair mundo da tela, é destruido
		if(x <= -128) instance_destroy();
	break;
	
	#endregion
	
}

#endregion