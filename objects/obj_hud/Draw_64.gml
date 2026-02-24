draw_sprite(sprite_index, 0, 0, hud_y);

draw_set_font(fnt_score);
draw_set_valign(1);

var _text_y = hud_y + (hud_height / 2);

draw_set_font(0);
draw_text(40, _text_y, string(floor(global.current_score)))

draw_set_halign(1);
draw_text(320, _text_y, "META: " + string(global.daily_quota));

draw_set_halign(2);
var _combo_color = (global.combo_multiplier > 1.0) ? c_orange: c_white;
draw_text_colour(600, _text_y, "MULTI: " + string(global.combo_multiplier) + "x", _combo_color, _combo_color, _combo_color, _combo_color, 1)

draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);