global.current_area = 0;

#region Ingredientes

global.item_database = {
	
	#region Mundo dos Vivos
	
	living: {
		cachaca: {
			display_name: "Cachaça",
			world_type: 0,
			sprite_index: spr_item_base
		},
	
		sparkling_water: {
			display_name: "Água Gaseficada",
			world_type: 0,
			sprite_index: spr_item_base
		},
	
		lemon_soda: {
			display_name: "Refrigerante de Limão",
			world_type: 0,
			sprite_index: spr_item_base
		},
	
		barry_syrup: {
			display_name: "Xarope de Frutas Vermelhas",
			world_type: 0,
			sprite_index: spr_item_base
		},
	
		honey: {
			display_name: "Mel",
			world_type: 0,
			sprite_index: spr_item_base
		},
	
		mint: {
			display_name: "Hortelã",
			world_type: 0,
			sprite_index: spr_item_base
		},
	},
	
	#endregion
	
	#region Mundo dos Mortos
	
	dead: {
		formaldehyde: {
			display_name: "Formol",
			world_type: 1,
			sprite_index: spr_item_base
		},
	
		swamp_water: {
			display_name: "Água do Pantano",
			world_type: 1,
			sprite_index: spr_item_base
		},

	
		sulfuric_acid: {
			display_name: "Ácido Sulfúrico",
			world_type: 1,
			sprite_index: spr_item_base
		},

	
		coagulated_blood: {
			display_name: "Sangue Coagulado",
			world_type: 1,
			sprite_index: spr_item_base
		},

	
		dragon_bile: {
			display_name: "Bile de Dragão",
			world_type: 1,
			sprite_index: spr_item_base
		},

	
		hamlock: {
			display_name: "Cicuta",
			world_type: 1,
			sprite_index: spr_item_base
		},
	},
		
	#endregion
	
}
	
#endregion

#region Receitas

global.all_recipes = {
	
	#region Mundo dos Vivos
	
	living:{
		restful_caipirinha:{
			ingredients: ["cachaca", "lemon_soda", "mint"],
			display_name: "Caipirinha de Repouso",
			world_type : 0
		},
		
		morning_dew:{
			ingredients: ["sparkling_water", "berry_syrup", "honey"],
			display_name: "Orvalho do amanhecer",
			world_type : 0
		},
		
		vitality_pulse:{
			ingredients: ["cachaca", "berry_syrup", "mint"],
			display_name: "Pulso de Vitalidade",
			world_type : 0
		},
		
		golden_breeze:{
			ingredients: ["sparkling_water", "lemon_soda", "honey"],
			display_name: "Brisa Dourada",
			world_type : 0
		},
		
		forest_freshness:{
			ingredients: ["lemon_soda", "berry_syrup", "mint"],
			display_name: "Frescor da Floresta",
			world_type : 0
		},
		
		breath_of_life:{
			ingredients: ["cachaca", "sparkling_water", "honey"],
			display_name: "Sopro de Vida",
			world_type : 0
		},
		
	},
	
	#endregion
	
	#region Mundo dos Mortos
	
	dead:{
		rigor_mortis:{
			ingredients: ["formaldehyde", "sulfuric_acid", "hemlock"],
			display_name: "Rigor Mortis",
			world_type : 1
		},
		
		putrid_sludge:{
			ingredients: ["swamp_water", "coagulated_blood", "dragon_bile"],
			display_name: "Lamaçal Putrefato",
			world_type : 1
		},
		
		widows_embrace:{
			ingredients: ["formaldehyde", "coagulated_blood", "hemlock"],
			display_name: "Abraço de Viúva",
			world_type : 1
		},
		
		corrosive_bile:{
			ingredients: ["swamp_water", "sulfuric_acid", "dragon_bile"],
			display_name: "Bile Corrosivo",
			world_type : 1
		},
		
		swamp_shriek:{
			ingredients: ["sulfuric_acid", "coagulated_blood", "hemlock"],
			display_name: "Grito do Pântano",
			world_type : 1
		},
		
		last_gasp:{
			ingredients: ["formaldehyde", "swamp_water", "dragon_bile"],
			display_name: "Último Suspiro",
			world_type : 1
		},
		
	},
	
	#endregion

}

#endregion

#region Função de Checar a Receita

function check_recipe(){
	
	var _current_world = (global.current_area == 0) ? "living" : "dead";
	
	var _world_recipes = global.all_recipes[$ _current_world];
	
	var _recipe_keys = variable_struct_get_names(_world_recipes);
	
	var _sorted_mixer = [];
	array_copy(_sorted_mixer, 0, mixer_contents, 0, array_length(mixer_contents));
	array_sort(_sorted_mixer, true);
	
	var _found_recipe = noone;
	
	for(var i = 0; i < array_length(_recipe_keys); i ++){
		var _key = _recipe_keys[i];
		var _recipe = _world_recipes[$ _key];
		
		var _sorted_recipe = [];
		array_copy(_sorted_recipe, 0, _recipe.ingredients, 0, array_length(_recipe.ingredients));
		array_sort(_sorted_recipe, true);
		
		if(array_equals(_sorted_mixer, _sorted_recipe)){
			_found_recipe = _key;
			break;
		}
	}
	
	if(_found_recipe != noone){
		var _drink_name = _world_recipes[$ _found_recipe].display_name;
		show_debug_message("Bebida criada com sucesso: " + _drink_name)
		
		final_drink = _found_recipe;
	}else{
		show_debug_message("Mistura incorreta! Gororoba criada.");
		
		final_drink = "Ruined Drink"
	}
};

#endregion