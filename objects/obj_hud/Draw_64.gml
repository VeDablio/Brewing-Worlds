// Desenha a sprite do hud, no primeiro frame dela, no X 0 e no Y definido
draw_sprite(sprite_index, 0, 0, hud_y);

// Definindo fonte de alinhamento vertical
draw_set_font(fnt_score);
draw_set_valign(1);

// Posição Y do texto é o centro da sprie da hud
var _text_y = hud_y + (hud_height / 2);

// Desenhando a pontuação atual no lado esquerdo da hud
draw_set_halign(0);
draw_text(40, _text_y, string(floor(global.current_score)))

// Desenhando a meta no centro da hud
draw_set_halign(1);
draw_text(320, _text_y, "META: " + string(global.daily_quota));

// Desenhando o combo de velocidade na direita do hud
draw_set_halign(2);
var _combo_color = (global.combo_multiplier > 1.0) ? c_orange: c_white;	// Se o combo aumentar, a cor do texto é laranja
draw_text_colour(600, _text_y, "MULTI: " + string(global.combo_multiplier) + "x", _combo_color, _combo_color, _combo_color, _combo_color, 1)

// Resetando formatação de texto
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);