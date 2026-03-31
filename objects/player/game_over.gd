extends State
class_name GameOverState

func enter():
	get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
