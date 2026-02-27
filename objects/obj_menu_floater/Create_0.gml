var _world_names			= variable_struct_get_names(global.all_recipes);
var _random_world_index		= irandom(array_length(_world_names) - 1);
var _chosen_world			= _world_names[_random_world_index];

var _world_struct			= global.all_recipes[$ _chosen_world];

var _recipe_names			= variable_struct_get_names(_world_struct);
var _random_recipe_index	= irandom(array_length(_recipe_names) - 1);
var _choose_recipe_name		= _recipe_names[_random_recipe_index];

var _recipe_data			= _world_struct[$ _choose_recipe_name];

sprite_index	= _recipe_data.sprite_result;

speed		= random_range(1, 3);
direction	= 0;

rot_speed	= random_range(-2, 2);

image_xscale	= random_range(0.8, 1.2);
image_yscale	= image_xscale;

image_alpha		= 0.6;
