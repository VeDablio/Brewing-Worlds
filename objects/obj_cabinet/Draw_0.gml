draw_self();

// Debug para saber os itens dos armários e qual item está segurando
draw_text(x, y, ingredient_id);
draw_text(mouse_x, mouse_y, string(global.held_item))