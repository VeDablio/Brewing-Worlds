// Ao clicar com o botão esquerdo do mouse no mixer
// Se tem algum item sendo segurado e o estágio do mixer é "esperando"
if(global.held_item != noone && mixer_state == "waiting"){
	// Se tiver espaço sobrando na array de itens do mixer
	if(array_length(mixer_contents) < max_ingredients){
		// Adiciona o item que estava sendo segurado ao mixer
		array_push(mixer_contents, global.held_item)
		
		image_xscale = .7;
		image_yscale = .7;
		
		// Reseta as informações de item segurado
		global.held_item	= noone;
		global.held_world	= noone;
		global.held_sprite	= noone;
		
		// Se a array estiver com todos os espaços preenchidos
		if(array_length(mixer_contents) == max_ingredients){
			// O estao do mixer se torna "shaking" (misturando)
			mixer_state = "shaking";
		}
	}
};

// Definindo uma variavel para saber se tem algum recipiente sendo segurado
var _is_holding_container = (global.held_item == "empty_glass" || global.held_item == "rusted_chalice")

// Se o estado do mixer for "finished" (finalizado) e está segurando algum recipiente
if(mixer_state == "finished" && _is_holding_container){
	
	// O item segurado se torna o drinque feito
	global.held_item = final_drink;
	
	// Se o drinque feito for o drinque estragado
	if(final_drink == "Ruined Drink"){
		// A sprite segurada se torna o drinque estragado
		global.held_sprite = spr_ruinned_drink_living
		
	// Caso o drinque não seja o estragado
	}else{
		// Aumenta pontos base de receitas corretas
		global.correct_recipes		+= 5;
		// Descobrindo em qual mundo o player está
		var _world = (global.current_area == 0) ? "living" : "dead";
		// Definindo a sprite com base no mundo e drinque feito
		global.held_sprite = global.all_recipes[$ _world][$ final_drink].sprite_result;
		
		var _popup	= instance_create_layer(x, y - 32, "Effects", obj_score_popup);
		_popup.text	= "+" + string(global.correct_recipes) + " Bonus de receita";
	}
	
	image_xscale = 1.3;
	image_yscale = 1.3;
	
	// Resetando as informações de drinque do mixer
	mixer_state		= "waiting";
	mixer_contents	= [];
	final_drink		= noone;
	shake_progress	= 0;
	
	// Debug para saber qual drinque está na taça
	show_debug_message("Drink servido na taca: " + string(global.held_item));
}