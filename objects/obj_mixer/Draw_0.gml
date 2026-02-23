draw_self();

// Desenhando barra de progresso
// Se o estado do mixer for "shaking" (misturando)
if(mixer_state == "shaking"){
	
	var _bar_w	= 64;				// largura da barra
	var _bar_h	= 10;				// Altura da barra
	var _x1		= x - (_bar_w / 2);	// Posição X inicial da barra
	var _y1		= y - 80;			// Posição Y inicial da barra
	
	// Desenhando o fundo preto da barra de progresso
	draw_set_colour(c_black);
	draw_rectangle(_x1, _y1, _x1 + _bar_w, _y1 + _bar_h, false);
	
	// Definindo a cor da barra de progresso
	var _color = (global.current_area == 0) ? c_lime : c_purple;
	draw_set_colour(_color);
	// Definindo o quanto da barra vai estar preenchida com base no progresso de mistura
	var _fill_width = (shake_progress / shake_target) * _bar_w;
	// Desenhando a barra de progresso
	draw_rectangle(_x1, _y1, _x1 + _fill_width, _y1 + _bar_h, false);
	
	// Resetando a cor dos desenhos
	draw_set_colour(c_white);
}