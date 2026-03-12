extends Node
class_name StateMachine

var current_state: State

func switch_state(new_state):
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state.enter()
	
func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)
