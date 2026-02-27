// Escolhendo entre o mundo dos vivos e o mundo dos mortos
// Se a ecsolha for 0 é mundo dos vivos, se for 1 é dos mortos
var _world_choice	= choose(0, 1);
var _world_name		= (_world_choice == 0) ? "living" : "dead";

// Dedinindo qual array de lugar do cliente escolher com base no mundo
var _slot_array		= (_world_choice == 0) ? global.slots_living : global.slots_dead;
var _x_array		= (_world_choice == 0) ? global.slots_living_x : global.slots_dead_x;

// Variavel para definir que o cliente não tem lugar inicial
var _my_slot = -1;
// loop para saber se tem lugar disponivel para o cliente
for(var i = 0; i < array_length(_slot_array); i++){
	// Se possui um lugar livre
	if(_slot_array[i] == false){
		// Então o cliente reserva aquele lugar
		_my_slot = i;
		break;
	}
};

// Se o lugar do cliente for algum lugar
if(_my_slot != -1){
	// Se o mundo do cliente for o mundo dos vivos, reserva o lugar dele na array dos vivos
	if(_world_choice == 0) global.slots_living[_my_slot] = true;
	// Caso o mundo seja dos mortos, reserva o lugar na array dos mortos	
	else global.slots_dead[_my_slot] = true;
	
	// Se o mundo for dos vivos o Y de spawn do cliente será 180, se o mundo for dos morto o Y será 540
	var _spawn_y	= (_world_choice == 0) ? 180 : 540;
	
	var _yscale	= (_world_choice == 0) ? 1 : -1;
	// Criando o cliente
	var _inst		= instance_create_layer(-62, _spawn_y, "Customers", obj_customer);
	
	// No cliente criado
	with(_inst){
		world_type		= _world_name;			// Passa para ele qual o mundo ele está
		slot_id			= _my_slot;				// Passa para ele qual é o lugar dele
		target_x		= _x_array[_my_slot];	// Passa para ele o X do lugar dele
		target_yscale	= _yscale; 
	}
};

// Reinicia o alarme
alarm[0] = irandom_range(spawn_rate_min, spawn_rate_max);