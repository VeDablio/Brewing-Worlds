// Se apertar com o botão esquerdo do mouse encima do cliente
// Se o estado for "esperando"
if(state == "waiting"){
	// Se o item entregue for o mesmo do pedido
	if(global.held_item == order_id){
		global.correct_deliveries	+= 5;	// Aumenta pontos base de entrega corretas
		
		// Pegando a o multi baseado na velocidade de entrega 
		var _speed_multi = calculate_speed_mult()
		
		// Chama a função de adicionar pontuação
		global.add_score(_speed_multi);
		// Aumenta o combo
		global.combo_multiplier = min(global.combo_multiplier + 0.1, global.combo_max);
		
		// Reseta o que está sendo segurado
		global.held_item	= noone;
		global.held_sprite	= noone;
		global.held_world	= noone;
		
		var _popup	= instance_create_layer(x, y - 32, "Effects", obj_score_popup);
		_popup.text	= "+" + string(global.correct_deliveries) + " Bônus de entrega";
		_popup.cor	= c_yellow; 
		
		image_xscale	= 1.3;
		image_yscale	= 1.3;
		
		show_debug_message("Era isso que eu queria")
		// Muda o estado para "saindo"
		state = "leaving";
		
	// Caso o item entregue não seja o mesmo do pedido
	}else if(global.held_item != noone){
		global.correct_recipes		= max(0, global.correct_recipes - 5);		// Diminui os pontos base de receitas corretas
		global.correct_deliveries	= max(0, global.correct_deliveries - 5);	// Diminui os pontos base de entregas corretas
		
		global.reset_combo();	// Reseta o combo
		
		// Reseta o que está sendo segurado
		global.held_item	= noone;
		global.held_sprite	= noone;
		global.held_world	= noone;
		
		var _sound	= (audio_play_sound(snd_wrong, 5, 0));
		
		var _random_pitch	= random_range(0.8, 1.2);
		audio_sound_pitch(_sound, _random_pitch);
		
		image_angle = choose(15, -15)
		show_debug_message("Não era isso que eu queria")
		
		// Muda o estado para "saindo"
		state = "leaving"
	}
}