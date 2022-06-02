extends Control

export var score_control_node_path : NodePath
onready var score_control_node : Node = get_node(score_control_node_path)

export var program_node_path : NodePath
onready var program_node : Node = get_node(program_node_path)

func _ready():
	pass # Replace with function body.
	
func set_winner(is_right_side : bool):
	if is_right_side:
		$winner.text = "Right player won!"
	else:
		$winner.text = "Left player won!"
	
func _on_restart_button_pressed():
	program_node.change_winning_screen_visibility(false)
	program_node.change_game_visibility(true)
	score_control_node.restart()
	
func _on_menu_button_pressed():
	program_node.change_menu_visibility(true)
	program_node.change_game_visibility(false)
	score_control_node.restart()
	program_node.change_winning_screen_visibility(false)
