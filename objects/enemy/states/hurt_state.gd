extends State
class_name HurtState

@export var exit_state: State
var hurt_tween: Tween
@export var hurt_noise: Resource

func enter():
	var start_rotation = state_machine.enemy.scale
	hurt_tween = create_tween()
	hurt_tween.tween_property(state_machine.enemy, "scale", start_rotation + Vector3(.2, .2, .2), .02)
	hurt_tween.tween_property(state_machine.enemy, "scale", start_rotation, .04)
	
	if hurt_noise: 
		state_machine.audio_player.stream = hurt_noise
		state_machine.audio_player.play()
	
	await hurt_tween.finished
	state_machine.switch_state(exit_state)

func exit():
	hurt_tween.kill()
	
