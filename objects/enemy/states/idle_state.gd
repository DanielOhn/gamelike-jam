extends State
class_name IdleState

var current_tween: Tween
@export var animation: String
@export var exit_state: State

func enter():
	if state_machine.target == null:
		idle_animation()
	elif exit_state != null:
		state_machine.switch_state(exit_state)

func exit():
	if current_tween:
		current_tween.kill()
		
func idle_animation():
	if state_machine.anim_player != null:
		state_machine.anim_player.play(animation)

	
