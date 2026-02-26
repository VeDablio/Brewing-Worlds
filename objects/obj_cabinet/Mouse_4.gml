// Ao clicar com o botão esquerdo do mouse no armario de itens
// Definindo uma variavel para pegar as informações do item do armario que foi selecionado
var _item_data = global.item_database[$ world_type][$ ingredient_id];

global.held_item	= ingredient_id;			// O item segurado se torna o item do armario
global.held_world	= world_type;				// O mundo do item se torna o mundo do item do armario
global.held_sprite	= _item_data.sprite_index;	// A sprite segurada se torna a sprite do item do armario

var _sound	= audio_play_sound(snd_select_item, 5, 0);

var _pitch	= random_range(0.8, 1.2);
audio_sound_pitch(_sound, _pitch);

// Debug para saber qual item pegou
show_debug_message("Pegou " + string(_item_data.display_name));