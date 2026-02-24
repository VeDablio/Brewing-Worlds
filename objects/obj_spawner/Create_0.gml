max_customers_side = 3;

global.slots_living		= array_create(max_customers_side, false)
global.slots_dead		= array_create(max_customers_side, false)
global.slots_living_x	= [];
global.slots_dead_x		= [];

var _spacing = 640 / (max_customers_side + 1);

for(var i = 0; i < max_customers_side; i++){
	var _pos_x = _spacing * (i + 1);
	
	array_push(global.slots_living_x, _pos_x);
	array_push(global.slots_dead_x, _pos_x);
}

spawn_rate_min = 180;
spawn_rate_max = 600;
alarm[0] = irandom_range(spawn_rate_min, spawn_rate_max);
