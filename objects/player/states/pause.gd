extends State
class_name PauseState

@export var pause_menu: Control

func enter():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = true
	pause_menu.visible = true
	
func physics_update(_delta: float) -> void:
	if Input.is_action_just_released("ui_cancel") and get_tree().paused == true:
		state_machine.switch_state(state_machine.find_child("Play"))

func exit():
	pause_menu.visible = false
	get_tree().paused = false
