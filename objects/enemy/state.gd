extends Node
class_name State

@onready var state_machine: StateMachine = get_parent()
signal state_finished(next_state: String)

func enter() -> void:
	print_debug(name)
	
func exit() -> void:
	pass
	
func physics_update(_delta: float) -> void:
	pass
