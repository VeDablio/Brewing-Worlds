if(keyboard_check_pressed(vk_space)) global.current_area = !global.current_area;

if(keyboard_check_pressed(ord("R"))) show_recipes = !show_recipes;

if(keyboard_check_pressed(vk_enter)){
	room_goto(rm_menu);
	audio_pause_all();
};