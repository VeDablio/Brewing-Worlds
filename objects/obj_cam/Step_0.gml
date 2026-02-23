if(global.current_area == 1){	// Levando a camera pro mundo dos mortos
	camera_set_view_pos(cam, 0, 360); 
	camera_set_view_angle(cam, 180);
}else{							// Levando a camera pro mundo dos vivos
	camera_set_view_pos(cam, 0, 0); 
	camera_set_view_angle(cam, 0);
}