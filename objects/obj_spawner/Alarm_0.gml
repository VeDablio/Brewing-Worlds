var _world_choice	= choose(0, 1);
var _world_name		= (_world_choice == 0) ? "living" : "dead";
var _slot_array		= (_world_choice == 0) ? global.slots_living : global.slots_dead;
var _x_array		= (_world_choice == 0) ? global.slots_living_x : global.slots_dead_x;

var _my_slot = -1;
for(var i = 0; i < array_length(_slot_array); i++){
	if(_slot_array[i] == false){
		_my_slot = i;
		break;
	}
};

if(_my_slot != -1){
	if(_world_choice == 0) global.slots_living[_my_slot] = true;
	else global.slots_dead[_my_slot] = true;
	
	var _spawn_y	= (_world_choice == 0) ? 180 : 540;
	var _inst		= instance_create_layer(-62, _spawn_y, "Customers", obj_customer);
	
	with(_inst){
		world_type	= _world_name;
		slot_id		= _my_slot;
		target_x	= _x_array[_my_slot];
	}
};

alarm[0] = irandom_range(spawn_rate_min, spawn_rate_max);