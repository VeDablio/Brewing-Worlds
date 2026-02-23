if(state == "waiting"){
	if(global.held_item == order_id){
		// Calcular pontos
		
		global.held_item	= noone;
		global.held_sprite	= noone;
		
		show_debug_message("Era isso que eu queria")
		state = "leaving"
	}else if(global.held_item != noone){
		// Resetar multiplicador
		
		global.held_item	= noone;
		global.held_sprite	= noone;
		
		show_debug_message("Não era isso que eu queria")
		state = "leaving"
	}
}