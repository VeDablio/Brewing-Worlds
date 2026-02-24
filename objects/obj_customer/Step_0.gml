switch(state){
	case "walking":
		if(abs(x - target_x) > move_spd){
			x += (x < target_x) ? move_spd : -move_spd;
		}else{
			x = target_x;
			state = "ordering";
		}
	break;
	
	case "ordering":
		select_order();
		state = "waiting";
	break;
	
	case "waiting":
		patience_current--;
		//show_debug_message(order_id);
		
		if(patience_current <= 0){
			global.reset_combo();
			state = "leaving";
		}
	break;
	
	case "leaving":
		x -= move_spd;
		release_slot();
		if(x <= -128) instance_destroy();
	break;
}