if(global.current_area == 1){	// Levando a camera pro mundo dos mortos
	camera_set_view_pos(cam, 0, 360); 
}else{							// Levando a camera pro mundo dos vivos
	camera_set_view_pos(cam, 0, 0); 
}