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

global.add_score = function(_speed_mult){ // Precisa receber do valor do multiplicador de velocidade
	// Pontos base = valor de receitas corretas + valor de entregas corretas
	var _base			= global.correct_deliveries + global.correct_deliveries;
	// Pontos a adicionar = (Pontos base) * multiplicador de velocidade * multiplicador de combo
	var _points_to_add	= (_base) * _speed_mult * global.combo_multiplier;
	
	// Adicionando os pontos ganhos ao pontos atuais
	global.current_score += _points_to_add;
	
	// Aumentando o multiplicador de combo
	global.combo_multiplier = min(global.combo_multiplier + 0.1, global.combo_max);
	
	show_debug_message("Entrega concluida! Pontos ganhos: " + string(_base));
}

#endregion

#region Função para Resetar o Combo

global.reset_combo = function(){
	// Resetando o valor do combo
	global.combo_multiplier = 1.0;
	show_debug_message("Combo quebrado!");
}

#endregion

#region Função de Calcular Velocidade

function calculate_speed_mult(){
	// Taxa de paciencia = paciencia atua / paciencia maxima
	var _patience_ratio = patience_current / patience_max;
	// Definindo uma valor padrão para o multiplicador de velocidade
	var _speed_mult = 1.0;
	
	// Se a taxa de paciencia for maior que 60%
	if(_patience_ratio >= 0.6){
		// Multiplicador de velocidade é 2x 
		_speed_mult = 2.0;
		
	// Se a taxa de paciencia for abaixo de 30%
	}else if(_patience_ratio <= 0.3){
		// O multiplicador de velocidade é 0.5x
		_speed_mult = 0.5
	}
	
	return 1.0
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
			sprite_index	: spr_cachaca
		},
	
		sparkling_water: {
			display_name	: "Água Gaseficada",
			world_type		: 0,
			sprite_index	: spr_sparkling_water
		},
	
		lemon_soda: {
			display_name	: "Refrigerante de Limão",
			world_type		: 0,
			sprite_index	: spr_lemon_soda
		},
	
		berry_syrup: {
			display_name	: "Xarope de Frutas Vermelhas",
			world_type		: 0,
			sprite_index	: spr_berry_syrup
		},
	
		honey: {
			display_name	: "Mel",
			world_type		: 0,
			sprite_index	: spr_honey
		},
	
		mint: {
			display_name	: "Hortelã",
			world_type		: 0,
			sprite_index	: spr_mint
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
			sprite_index	: spr_formaldehyde
		},
	
		swamp_water: {
			display_name	: "Água do Pantano",
			world_type		: 1,
			sprite_index	: spr_swamp_water
		},

	
		sulfuric_acid: {
			display_name	: "Ácido Sulfúrico",
			world_type		: 1,
			sprite_index	: spr_sulfuric_acid
		},

	
		coagulated_blood: {
			display_name	: "Sangue Coagulado",
			world_type		: 1,
			sprite_index	: spr_coagulated_blood
		},

	
		dragon_bile: {
			display_name	: "Bile de Dragão",
			world_type		: 1,
			sprite_index	: spr_dragon_bile
		},

	
		hamlock: {
			display_name	: "Cicuta",
			world_type		: 1,
			sprite_index	: spr_hamlock
		},
		
		big_flask: {
			display_name	: "Cálice Enferrujado",
			world_type		: 1,
			sprite_index	: spr_big_flask
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
			sprite_result	: spr_restful_caipirinha
		},
		
		morning_dew:{
			ingredients		: ["sparkling_water", "berry_syrup", "honey"],
			display_name	: "Orvalho do amanhecer",
			world_type		: 0,
			sprite_result	: spr_morning_dew
		},
		
		vitality_pulse:{
			ingredients		: ["cachaca", "berry_syrup", "mint"],
			display_name	: "Pulso de Vitalidade",
			world_type		: 0,
			sprite_result	: spr_vitality_pulse
		},
		
		golden_breeze:{
			ingredients		: ["sparkling_water", "lemon_soda", "honey"],
			display_name	: "Brisa Dourada",
			world_type		: 0,
			sprite_result	: spr_golden_breeze
		},
		
		forest_freshness:{
			ingredients		: ["lemon_soda", "berry_syrup", "mint"],
			display_name	: "Frescor da Floresta",
			world_type		: 0,
			sprite_result	: spr_forest_freshness
		},
		
		breath_of_life:{
			ingredients		: ["cachaca", "sparkling_water", "honey"],
			display_name	: "Sopro de Vida",
			world_type		: 0,
			sprite_result	: spr_breath_of_life
		},
		
	},
	
	#endregion
	
	#region Mundo dos Mortos
	
	dead:{
		rigor_mortis:{
			ingredients		: ["formaldehyde", "sulfuric_acid", "hamlock"],
			display_name	: "Rigor Mortis",
			world_type		: 1,
			sprite_result	: spr_rigor_mortis
		},
		
		putrid_sludge:{
			ingredients		: ["swamp_water", "coagulated_blood", "dragon_bile"],
			display_name	: "Lamaçal Putrefato",
			world_type		: 1,
			sprite_result	: spr_putrid_sludge
		},
		
		widows_embrace:{
			ingredients		: ["formaldehyde", "coagulated_blood", "hamlock"],
			display_name	: "Abraço de Viúva",
			world_type		: 1,
			sprite_result	: spr_widows_embrace
		},
		
		corrosive_bile:{
			ingredients		: ["swamp_water", "sulfuric_acid", "dragon_bile"],
			display_name	: "Bile Corrosivo",
			world_type		: 1,
			sprite_result	: spr_corrosive_bile
		},
		
		swamp_shriek:{
			ingredients		: ["sulfuric_acid", "coagulated_blood", "hamlock"],
			display_name	: "Grito do Pântano",
			world_type		: 1,
			sprite_result	: spr_swamp_shriek
		},
		
		last_gasp:{
			ingredients		: ["formaldehyde", "swamp_water", "dragon_bile"],
			display_name	: "Último Suspiro",
			world_type		: 1,
			sprite_result	: spr_last_gasp
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
	// Pegando a lista de receitas baseada no mundo que o cliente está
	var _recipe_list	= variable_struct_get_names(global.all_recipes[$ world_type]);
	// Selecionando uma das receitas aleatoriamente
	var _index			= irandom(array_length(_recipe_list) - 1);
	
	// Definindo qual é a receita escolhida
	order_id		= _recipe_list[_index];
	// Definindo qual é a sprite da receita
	order_sprite	= global.all_recipes[$ world_type][$ order_id].sprite_result;
}

#endregion

#region Função de Liberar Vaga

function release_slot(){
	// Se o cliente estiver em alguma vaga
	if(slot_id != -1){
		// Se o mundo que ele está for o mundo dos vivos
		if(world_type == "living"){
			// Libera a vaga na array do mundo dos vivos
			global.slots_living[slot_id] = false
		
		// Se for o mundo dos mortos
		}else{
			// Libera a vaga na array do mundo dos mortos
			global.slots_dead[slot_id] = false;
		}
		
		// Define que o cliente está sem vaga
		slot_id = -1;
	}

}

#endregion

#endregion