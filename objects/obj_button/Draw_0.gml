draw_self();

draw_set_halign(1);
draw_set_valign(1);
draw_set_colour(c_white);
draw_set_font(fnt_text);

draw_text_transformed(x, y, button_text, target_scale, target_scale, 0);