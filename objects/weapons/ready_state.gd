extends State
class_name ReadyState

func physics_update(_delta: float) -> void:
	if state_machine.current_ammo <= 0:
		state_machine.switch_state(state_machine.find_child("ReloadState"))
