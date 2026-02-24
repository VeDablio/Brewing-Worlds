draw_self()

// Se o estado for "esperando"
if(state == "waiting"){
	var _bar_w		= 60;
	var _balloon_y	= y - 100;
	
	// Desenha um balão de fala para o cliente
	draw_sprite(spr_ui_baloon, 0, x, _balloon_y);
	
	// Se existir um pedido
	if(order_sprite != noone){
		// Desenha a sprite do pedido no centro do balão
		draw_sprite_ext(order_sprite, 0, x, _balloon_y, .5, .5, 0, c_white, 1)
	}
	
	// Desenha uma barra de paciencia que diminui junto com a paciencia do cliente
    draw_healthbar(x - 30, _balloon_y + 40, x + 30, _balloon_y + 50, (patience_current/patience_max)*100, c_black, c_red, c_green, 0, true, true);
}