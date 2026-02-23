var _world_choice = choose(0, 1);

var _spawn_y	= 0;
var _world_name	= "";

if(_world_choice == 0){
	_spawn_y	= 180;
	_world_name = "living"
}else{
	_spawn_y	= 540;
	_world_name = "dead"
}

var _count = 0;
with(obj_customer){
	if(world_type == _world_name) _count++
}

if(_count < max_customers_side){
	var _new_customer = instance_create_layer(-128, _spawn_y, "Customers", obj_customer);
	
	with(_new_customer){
		world_type = _world_name;
	}
};

alarm[0] = irandom_range(spawn_rate_min, spawn_rate_max);
