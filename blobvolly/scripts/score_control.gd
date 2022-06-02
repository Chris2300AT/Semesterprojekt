extends Control

export var game_node_path : NodePath
onready var game_node : Node = get_node(game_node_path)

export var winning_screen_node_path : NodePath
onready var winning_screen_node : Node = get_node(winning_screen_node_path)

var points_right_player = 0;
var points_left_player = 0;
var winning_score = 3;

func restart():
	winning_score = 3;
	points_right_player = 0;
	points_left_player = 0;
	$left_player_score.text = str(points_left_player)
	$right_player_score.text = str(points_right_player)

func add_score(is_right_side : bool):
	winning_screen_node.visible = false
	if !_winner_detected(): # Funktion Winner Detectet wird aufgerufen und geprüft ob ein Gewinner vorhanden ist 
		if is_right_side: # Die Seite wird geprüft
			points_left_player+=1	
			$left_player_score.text = str(points_left_player) # Der neue Punkte Stand wird ausgegeben
		else:
			points_right_player+=1 
			$right_player_score.text = str(points_right_player) # Der neue Punkte Stand wird ausgegeben
	if _winner_detected(): # Wenn Gewinner festgestelt
		game_node.propagate_call("set_process", [false]) # Das Spiel wird gestoppt 
		game_node.propagate_call("set_physics_process", [false]) # Die Physik wird gestoppt
		if is_right_side: # Letzter Punkt entscheidet das Spiel
			winning_screen_node.visible = true  # Gewinner Scene wird sichtbar gemacht
			winning_screen_node.set_winner(false) # Gewinner Seite wird mitgegeben
		else:
			winning_screen_node.visible = true
			winning_screen_node.set_winner(true)
	
	if(points_left_player == points_right_player && points_left_player == winning_score-1): # Um die Zwei Unterschied 
		winning_score += 1;

func _winner_detected():
	return ((points_left_player >= (winning_score)) || (points_right_player >= (winning_score)))
