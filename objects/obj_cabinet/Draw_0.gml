draw_self();

var _item_data = global.item_database[$ world_type][$ ingredient_id];
var _sprite = _item_data.sprite_index

draw_sprite_ext(_sprite, 0, x, y, .75, .75, 0, c_white, 1);