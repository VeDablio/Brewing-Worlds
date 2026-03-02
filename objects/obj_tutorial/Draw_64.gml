var _spr	= (global.current_area == 0) ? spr_recipe_book_living : spr_recipe_book_dead;
draw_sprite(_spr, 0, 620, 180)

draw_set_halign(1);
draw_set_valign(0);
draw_text(620, 200, "R")

draw_set_halign(1);
draw_set_valign(1);
draw_text(320, 180, "Aperte ENTER para voltar ao menu");

// Se o sprite do item segurado foi definido
if(global.held_sprite != noone){
	// Desenhamos ele no X e Y do mouse para a GUI
	var _my_x = device_mouse_x_to_gui(0)
	var _my_y = device_mouse_y_to_gui(0)
	draw_sprite(global.held_sprite, 0, _my_x, _my_y);
};

draw_set_font(fnt_text);
draw_set_halign(1);
draw_set_valign(1);

if(global.current_area == 0){
	with(obj_mixer){
		draw_text(x, y + 32, "Eu sou o mixer!");
	}
	
	draw_set_halign(0);

	draw_text(20, 20, "Botão esquerdo para selecionar item");
	draw_text(20, 40, "Botão direito para soltar item e limpar mixer");
	draw_text(20, 60, "Espaço para mudar de área")
	draw_text(20, 80, "Pressione 'R' para abrir o livro de receitas")
};

if(show_recipes){
	var _world_key = (global.current_area == 0) ? "living" : "dead";
	var _world_items	= global.item_database[$ _world_key];
	
	draw_set_colour(c_maroon);
	draw_rectangle(280, 60, 640, 290, false);
	
	draw_set_colour(c_white)
	
	var _recipes_in_world	= global.all_recipes[$ _world_key];
	var _recipe_names		= variable_struct_get_names(_recipes_in_world)
	var _recipe_count		= array_length(_recipe_names)
	
	for(var i = 0; i < _recipe_count; i++){
		var _name	= _recipe_names [i];
		var _data	= _recipes_in_world[$ _name];
		
		var _yy	= 80 + (i * 32);
		if(struct_exists(_data, "sprite_result")){
			draw_sprite_ext(_data.sprite_result, 0, 300, _yy, .5, .5, 0, c_white, 1);
		}
		
		draw_set_halign(0)
		draw_text(320, _yy, string(_data.display_name));
		
		var _ing_array		= _data.ingredients;
		var _start_x		= 520;
		
		for(var j = 0; j < array_length(_ing_array); j++){
			var _ing_name		= _ing_array[j];
			
			var _item_data		= _world_items[$ _ing_name];
			
			if(!is_undefined(_item_data)){
				var _ing_spr		= _item_data.sprite_index;
			
				draw_sprite_ext(_ing_spr, 0, _start_x + (j * 50), _yy, .4, .4, 0, c_white, 1);
			
				if(j < array_length(_ing_array) - 1){
					draw_text(_start_x + (50 * j) + 25, _yy, "+");
				}
			}else{
				draw_text(_start_x + (j * 70), _yy + 25, "?");
			}
		}
	}
	draw_set_halign(fa_center);
    draw_text(470, 270, "Press 'R' to close");
}