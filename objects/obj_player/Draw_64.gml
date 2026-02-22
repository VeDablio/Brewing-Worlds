if(global.held_sprite != noone){
	var _my_x = device_mouse_x_to_gui(0)
	var _my_y = device_mouse_y_to_gui(0)
	
	draw_sprite(global.held_sprite, 0, _my_x, _my_y);
}