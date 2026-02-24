// Se for o mundo dos vivos
if(global.current_area == 0){
	hud_y			= 0;				// O Y da hud é 0
	sprite_index	= spr_hud_living;	// A sprite é a sprite da hud do mundo dos vivos

// Caso seja o mundo dos mortps
}else{
	hud_y			= gui_height - hud_height;	// O Y será a altura da GUI menos a altura da hud (desenha na parte inferior da tela)
	sprite_index	= spr_hud_dead;				// A sprite é a sprite da hud do mundo dos mortos
}