extends Control

@export var player_state_machine: StateMachine

func _on_resume_button_pressed():
	player_state_machine.switch_state(player_state_machine.find_child("Play"))


func _on_menu_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
