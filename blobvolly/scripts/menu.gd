extends Control

export var program_node_path : NodePath
onready var program_node : Node = get_node(program_node_path)

func _ready():
	program_node.change_game_visibility(false)
	program_node.change_winning_screen_visibility(false)

func switch_to_game():
	program_node.change_menu_visibility(false)
	program_node.change_game_visibility(true)

func _on_Button_pressed():
	switch_to_game()
