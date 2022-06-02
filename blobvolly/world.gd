extends Node

func _ready():
	pass # Replace with function body.

func change_game_visibility(show : bool):
	$game.visible = show
	$game.propagate_call("set_process", [show])
	$game.propagate_call("set_physics_process", [show])
	$winning_screen.visible = !show
	$score_control.visible = show
		
func change_menu_visibility(show : bool):
	$menu.visible = show
	propagate_call("set_process", [show])
	
func change_winning_screen_visibility(show : bool):
		$winning_screen.visible = show
		propagate_call("set_process", [show])
