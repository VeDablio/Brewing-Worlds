draw_self()

// Se o estado for "esperando"
if(state == "waiting"){
	var _bar_w		= 60;
	var _bar_y1		= (world_type == "living") ? y - 60 : y + 60;
	var _bar_y2		= (world_type == "living") ? y - 50 : y + 50;
	var _balloon_y	= (world_type == "living") ? y - 100 : y +100
	
	var _spr_baloon = (world_type == "living") ? spr_speech_bubble_living : spr_speech_bubble_dead;
	
	// Desenha um balão de fala para o cliente
	draw_sprite(_spr_baloon, 0, x, _balloon_y);
	
	// Se existir um pedido
	if(order_sprite != noone){
		// Desenha a sprite do pedido no centro do balão
		draw_sprite_ext(order_sprite, 0, x, _balloon_y , .5, .5, 0, c_white, 1)
	}
	
	// Desenha uma barra de paciencia que diminui junto com a paciencia do cliente
    draw_healthbar(x - 30, _bar_y1, x + 30, _bar_y2, (patience_current/patience_max)*100, c_black, c_red, c_green, 0, true, true);
}