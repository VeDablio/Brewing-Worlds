max_customers_side = 3;	// Maximo de clientes por mundo

global.slots_living		= array_create(max_customers_side, false)	// Array para definir em qual lugar o cliente vai estar no mundo dos vivos
global.slots_dead		= array_create(max_customers_side, false)	// Array para definir em qual lugar o cliente vai estar no mundo dos mortos
global.slots_living_x	= [];										// Array para definir o X de cada cliente no mundo dos vivos
global.slots_dead_x		= [];										// Array para definir o X de cada cliente no mundo dos mortos

// Definindo o espaço entre cada cliente 
// +1 pois queremos saber o espaço entre o clientes e não a posição que eles irão ficar
// Espaçamento = largura da tela / (maximo de clientes + 1)
var _spacing = 640 / (max_customers_side + 1);

// Loop para saber a posição de cada cliente
for(var i = 0; i < max_customers_side; i++){
	// +1 pq o primeiro valor de i é 0, e precisamos do primeiro espaçamento entre o cliente e a parede
	// Posição X = espaçamento * (i + 1)
	var _pos_x = _spacing * (i + 1);
	
	// Adicionado as posições X nas arrays
	array_push(global.slots_living_x, _pos_x);
	array_push(global.slots_dead_x, _pos_x);
}


spawn_rate_min = 180;	// Taxa minima de spawn é 180 frames (3 segs)
spawn_rate_max = 600;	// Taxa máxima de spawn é 600 frames (10 segs)

// Iniciando o alarme zero com base na taxa minima e maxima de spawn
alarm[0] = irandom_range(spawn_rate_min, spawn_rate_max);
