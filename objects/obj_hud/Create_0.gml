// Definindo as sprites de hud para cada mundo
spr_hud_living	= spr_hud_top;
spr_hud_dead	= spr_hud_bottom

// Salvando a altura da sprite do hud
hud_height = sprite_get_height(spr_hud_living);

gui_height	= 360;	// Salvando a altura da GUI
hud_y		= 0;	// Definindo um Y para a hud

show_recipes	= false;