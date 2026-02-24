#region Variaveis Globais

#region Receitas

global.current_area	= 0;
global.held_item	= noone;
global.held_world	= noone;
global.held_sprite	= noone;

#endregion

#region Pontuação
global.correct_recipes		= 0;
global.correct_deliveries	= 0
global.current_score		= 0;
global.daily_quota			= 500;
global.combo_multiplier		= 1.0;
global.combo_max			= 2.5;

#endregion

#endregion

#region Funções de Pontuação

#region Função para adicionar pontos

global.add_score = function(_speed_mult){
	var _base			= global.correct_deliveries + global.correct_deliveries;
	var _points_to_add	= (_base) * _speed_mult * global.combo_multiplier;
	
	global.current_score += _points_to_add;
	
	global.combo_multiplier = min(global.combo_multiplier + 0.1, global.combo_max);
	
	show_debug_message("Entrega concluida! Pontos ganhos: " + string(_base));
}

#endregion

#region Função para Resetar o Combo

global.reset_combo = function(){
	global.combo_multiplier = 1.0;
	show_debug_message("Combo quebrado!");
}

#endregion

#region Função de Calcular Velocidade

calculate_speed_mult = function(){
		var _patience_ratio = patience_current / patience_max;
		var _speed_mult = 1.0;
		
		if(_patience_ratio >= 0.6){
			_speed_mult = 2.0;
		}else if(_patience_ratio <= 0.3){
			_speed_mult = 0.5
		}
}

#endregion

#endregion

#region Drinques

#region Ingredientes

global.item_database = {
	
	#region Mundo dos Vivos
	
	living: {
		cachaca: {
			display_name	: "Cachaça",
			world_type		: 0,
			sprite_index	: spr_item_base
		},
	
		sparkling_water: {
			display_name	: "Água Gaseficada",
			world_type		: 0,
			sprite_index	: spr_item_base
		},
	
		lemon_soda: {
			display_name	: "Refrigerante de Limão",
			world_type		: 0,
			sprite_index	: spr_item_base
		},
	
		berry_syrup: {
			display_name	: "Xarope de Frutas Vermelhas",
			world_type		: 0,
			sprite_index	: spr_item_base
		},
	
		honey: {
			display_name	: "Mel",
			world_type		: 0,
			sprite_index	: spr_item_base
		},
	
		mint: {
			display_name	: "Hortelã",
			world_type		: 0,
			sprite_index	: spr_item_base
		},
		
		empty_glass: {
			display_name	: "Taça Vazia",
			world_type		: 0,
			sprite_index	: spr_cup,
		}
	},
	
	#endregion
	
	#region Mundo dos Mortos
	
	dead: {
		formaldehyde: {
			display_name	: "Formol",
			world_type		: 1,
			sprite_index	: spr_item_base
		},
	
		swamp_water: {
			display_name	: "Água do Pantano",
			world_type		: 1,
			sprite_index	: spr_item_base
		},

	
		sulfuric_acid: {
			display_name	: "Ácido Sulfúrico",
			world_type		: 1,
			sprite_index	: spr_item_base
		},

	
		coagulated_blood: {
			display_name	: "Sangue Coagulado",
			world_type		: 1,
			sprite_index	: spr_item_base
		},

	
		dragon_bile: {
			display_name	: "Bile de Dragão",
			world_type		: 1,
			sprite_index	: spr_item_base
		},

	
		hamlock: {
			display_name	: "Cicuta",
			world_type		: 1,
			sprite_index	: spr_item_base
		},
		
		rusted_chalice: {
			display_name	: "Cálice Enferrujado",
			world_type		: 1,
			sprite_index	: spr_cup
		}
	},
		
	#endregion
	
}
	
#endregion

#region Receitas

global.all_recipes = {
	
	#region Mundo dos Vivos
	
	living:{
		restful_caipirinha:{
			ingredients		: ["cachaca", "lemon_soda", "mint"],
			display_name	: "Caipirinha de Repouso",
			world_type		: 0,
			sprite_result	: spr_cup
		},
		
		morning_dew:{
			ingredients		: ["sparkling_water", "berry_syrup", "honey"],
			display_name	: "Orvalho do amanhecer",
			world_type		: 0,
			sprite_result	: spr_cup
		},
		
		vitality_pulse:{
			ingredients		: ["cachaca", "berry_syrup", "mint"],
			display_name	: "Pulso de Vitalidade",
			world_type		: 0,
			sprite_result	: spr_cup
		},
		
		golden_breeze:{
			ingredients		: ["sparkling_water", "lemon_soda", "honey"],
			display_name	: "Brisa Dourada",
			world_type		: 0,
			sprite_result	: spr_cup
		},
		
		forest_freshness:{
			ingredients		: ["lemon_soda", "berry_syrup", "mint"],
			display_name	: "Frescor da Floresta",
			world_type		: 0,
			sprite_result	: spr_cup
		},
		
		breath_of_life:{
			ingredients		: ["cachaca", "sparkling_water", "honey"],
			display_name	: "Sopro de Vida",
			world_type		: 0,
			sprite_result	: spr_cup
		},
		
	},
	
	#endregion
	
	#region Mundo dos Mortos
	
	dead:{
		rigor_mortis:{
			ingredients		: ["formaldehyde", "sulfuric_acid", "hemlock"],
			display_name	: "Rigor Mortis",
			world_type		: 1,
			sprite_result	: spr_cup
		},
		
		putrid_sludge:{
			ingredients		: ["swamp_water", "coagulated_blood", "dragon_bile"],
			display_name	: "Lamaçal Putrefato",
			world_type		: 1,
			sprite_result	: spr_cup
		},
		
		widows_embrace:{
			ingredients		: ["formaldehyde", "coagulated_blood", "hemlock"],
			display_name	: "Abraço de Viúva",
			world_type		: 1,
			sprite_result	: spr_cup
		},
		
		corrosive_bile:{
			ingredients		: ["swamp_water", "sulfuric_acid", "dragon_bile"],
			display_name	: "Bile Corrosivo",
			world_type		: 1,
			sprite_result	: spr_cup
		},
		
		swamp_shriek:{
			ingredients		: ["sulfuric_acid", "coagulated_blood", "hemlock"],
			display_name	: "Grito do Pântano",
			world_type		: 1,
			sprite_result	: spr_cup
		},
		
		last_gasp:{
			ingredients		: ["formaldehyde", "swamp_water", "dragon_bile"],
			display_name	: "Último Suspiro",
			world_type		: 1,
			sprite_result	: spr_cup
		},
		
	},
	
	#endregion

}

#endregion

#region Função de Checar se a Receita está Correta

function check_recipe(){
	// Descobrindo em qual mundo o player está
	var _current_world = (global.current_area == 0) ? "living" : "dead";
	
	// Pegando as receitas do mundo em que o player está
	var _world_recipes = global.all_recipes[$ _current_world];
	
	// Pegando as chaves (nome) das receitas do mundo do player
	var _recipe_keys = variable_struct_get_names(_world_recipes);
	
	// Criando uma array para copiar e organizar a array de itens no mixer
	var _sorted_mixer = [];
	array_copy(_sorted_mixer, 0, mixer_contents, 0, array_length(mixer_contents)); // Copiando
	array_sort(_sorted_mixer, true);												// Organizando
	
	show_debug_message("--- INICIANDO CHECAGEM DE RECEITA ---");
    show_debug_message("Itens no Mixer: " + string(_sorted_mixer));
	
	// Criando uma variavel para saber qual receita foi feita
	var _found_recipe = noone;
	
	// Loop para verificar todos os itens da array de receitas
	for(var i = 0; i < array_length(_recipe_keys); i ++){
		// Pegando a chave do item i da array 
		var _key = _recipe_keys[i];
		// Pegando a receita do item i da array
		var _recipe = _world_recipes[$ _key];
		
		// Criando uma array para copiar e organizar a array de ingredientes da receita
		var _sorted_recipe = [];
		array_copy(_sorted_recipe, 0, _recipe.ingredients, 0, array_length(_recipe.ingredients));	// Copiando
		array_sort(_sorted_recipe, true);															// Organizando
		
		show_debug_message("Comparando com [" + _key + "]: " + string(_sorted_recipe));
		
		// Verificando se os itens no mixer são os mesmos da receita do item i
		if(array_equals(_sorted_mixer, _sorted_recipe)){
			// Se os itens são os mesmos, então encontranmos a receita
			_found_recipe = _key;
			break;
		}
	}
	
	// Se a variavel de receita encontrada é uma receita válida
	if(_found_recipe != noone){
		// Pegando o nome do drinque
		var _drink_name = _world_recipes[$ _found_recipe].display_name;
		show_debug_message("Bebida criada com sucesso: " + _drink_name)
		
		// Definindo para o mixer qual é nosso drinque feito
		final_drink = _found_recipe;
		
	// Caso a receita não seja válida
	}else{
		show_debug_message("Mistura incorreta! Gororoba criada.");
		
		// O drinque foi estragado
		final_drink = "Ruined Drink"
	}
	
	show_debug_message("--- FIM DA CHECAGEM ---");
};

#endregion

#endregion

#region Clientes

#region Função de Escolher Pedido

function select_order(){
	var _recipe_list	= variable_struct_get_names(global.all_recipes[$ world_type]);
	var _index			= irandom(array_length(_recipe_list) - 1);
	
	order_id		= _recipe_list[_index];
	order_sprite	= global.all_recipes[$ world_type][$ order_id].sprite_result;
}

#endregion

#region Função de Liberar Vaga

function release_slot(){

	if(slot_id != -1){
		if(world_type == "living"){
			global.slots_living[slot_id] = false
		}else{
			global.slots_dead[slot_id] = false;
		}
		
		slot_id = -1;
	}

}

#endregion

#endregion