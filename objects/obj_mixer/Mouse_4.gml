if(global.held_item != noone && mixer_state == "waiting"){
	if(array_length(mixer_contents) < max_ingredients){
		array_push(mixer_contents, global.held_item)
		
		global.held_item = noone;
		global.held_world = noone;
		global.held_sprite = noone;
		
		if(array_length(mixer_contents) == max_ingredients){
			mixer_state = "shaking";
		}
	}
}
