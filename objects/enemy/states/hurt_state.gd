extends State
class_name HurtState

@export var exit_state: State
var hurt_tween: Tween 

func enter():
	var start_rotation = state_machine.enemy.rotation.x
	hurt_tween = create_tween()
	hurt_tween.tween_property(state_machine.enemy, "rotation:x", start_rotation + PI / 4, .02)
	hurt_tween.tween_property(state_machine.enemy, "rotation:x", start_rotation, .04)
	await hurt_tween.finished
	

	state_machine.switch_state(exit_state)

func exit():
	hurt_tween.kill()
	
