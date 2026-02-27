#region Pontuação

// Desenha a sprite do hud, no primeiro frame dela, no X 0 e no Y definido
draw_sprite(sprite_index, 0, 0, hud_y);

// Definindo fonte de alinhamento vertical
draw_set_font(fnt_text);
draw_set_valign(1);

// Posição Y do texto é o centro da sprie da hud
var _text_y = hud_y + (hud_height / 2);

// Desenhando a pontuação atual no lado esquerdo da hud
draw_set_halign(0);
draw_text(40, _text_y, string(floor(global.current_score)))

// Desenhando a meta no centro da hud
var _combo_color = (global.combo_multiplier > 1.0) ? c_orange: c_white;	// Se o combo aumentar, a cor do texto é laranja
var _base = global.correct_deliveries + global.correct_recipes;

draw_set_halign(2);
draw_text_colour(270, _text_y, "Base: " + string(_base) + " X ", _combo_color, _combo_color, _combo_color, _combo_color, 1);

draw_set_halign(1);
draw_text_colour(320, _text_y, "Multi: " + string(global.combo_multiplier) + " X ", _combo_color, _combo_color, _combo_color, _combo_color, 1);

draw_set_halign(0);
draw_text_colour(360, _text_y, "Combo: " + string(global.combo_multiplier), _combo_color, _combo_color, _combo_color, _combo_color, 1);

// Desenhando o combo de velocidade na direita do hud
draw_set_halign(2);
draw_text(600, _text_y, "META: " + string(global.daily_quota));

#endregion

#region Contador de clientes

var _other_world	= (global.current_area == 0) ? "dead" : "living";
var _customer_count	= 0;

with(obj_customer){
	if(world_type == _other_world) _customer_count ++;
};

if(_customer_count > 0){
	draw_set_colour(c_red);
	draw_rectangle(10, 100, 90, 200, false);
	
	draw_set_colour(c_white)
	draw_set_halign(1);
	draw_set_valign(1);
	
	draw_text(50, 120, "OUTRO BAR");
	draw_text(50, 150, "Clientes:")
	draw_text(50, 180, string(_customer_count))
}

#endregion

#region Livro de receitas

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

#endregion

// Resetando formatação de texto
draw_set_color(c_white);
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);