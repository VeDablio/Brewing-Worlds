if(state == "waiting"){
	if(global.held_item == order_id){
		global.correct_deliveries	+= 5;
		global.correct_recipes		+= 5;
	
		var _speed_multi = calculate_speed_mult()
		
		global.add_score(_speed_multi);
		global.combo_multiplier = min(global.combo_multiplier + 0.1, global.combo_max);
		
		global.held_item	= noone;
		global.held_sprite	= noone;
		
		show_debug_message("Era isso que eu queria")
		state = "leaving"
	}else if(global.held_item != noone){
		global.correct_recipes		= max(0, global.correct_recipes - 5);
		global.correct_deliveries	= max(0, global.correct_deliveries - 5);
		
		global.reset_combo();
		
		global.held_item	= noone;
		global.held_sprite	= noone;
		
		show_debug_message("Não era isso que eu queria")
		state = "leaving"
	}
}