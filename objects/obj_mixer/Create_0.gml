mixer_contents	= [];		// Array de itens colocados no mixer
max_ingredients	= 3;		// Máximo de itens para colocar no mixer
final_drink		= noone;	// Drinque feito

mixer_state = "waiting";	// Estágio do mixer, padrão definido como "waiting" (esperando)

shake_progress	= 0;		// Progresso de mistura do drinque
shake_target	= 100;		// Alvo do progresso de mistura
last_mouse_x	= mouse_x;	// Salvando a última posição do mouse
shake_threshold	= 20;		// O quanto precisa mexer o mouse para contar progresso;
last_direction	= 0;		// Salvando a última direção do mouse