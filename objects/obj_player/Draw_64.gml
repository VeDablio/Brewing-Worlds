// Barra de progresso do dia
if(day_timer > 0){
	var _bar_w	= 640;
	var _bar_h	= 5;
	var _x1		= 0;
	var _y1		= (global.current_area == 0) ? 40 : 315;
	var _fill	= (day_timer/day_duration) * _bar_w;
	draw_rectangle(_x1, _y1,  _x1 + _fill, _y1 + _bar_h, 0);
}

// Se o sprite do item segurado foi definido
if(global.held_sprite != noone){
	// Desenhamos ele no X e Y do mouse para a GUI
	var _my_x = device_mouse_x_to_gui(0)
	var _my_y = device_mouse_y_to_gui(0)
	draw_sprite(global.held_sprite, 0, _my_x, _my_y);
}

// Texto para informar como resetar
draw_set_halign(1);
draw_set_valign(1);
draw_set_font(fnt_score);
if(game_state == "finished"){
	var _stats = (day_result == "win") ? "Você venceu!" : "Você perdeu";
	var _text = "Aperte ENTER para reiniciar";
	draw_text(320, 180, _stats + "\n" + _text);
}
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(fnt_score);