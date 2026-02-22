var _item_data = global.item_database[$ world_type][$ ingredient_id];

global.held_item = ingredient_id;
global.held_world = world_type;
global.held_sprite = _item_data.sprite_index;

show_debug_message("Pegou " + string(_item_data.display_name));