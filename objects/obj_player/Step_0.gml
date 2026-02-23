// Mudando de mundo se apertar espaço
if(keyboard_check_pressed(vk_space)){
	global.current_area = !global.current_area;
	with(obj_hud){
		hud_y += (global.current_area == 0) ? 10 : -10
	}
}
