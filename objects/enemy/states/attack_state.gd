extends State
class_name AttackState

@export var exit_state: State
@export var timer: Timer
@export var attack_noise: Resource

func enter():
	
	timer.start()
	state_machine.anim_player.play("metarig|attack")
	state_machine.enemy.hitbox.monitoring = true
	if attack_noise:
		state_machine.audio_player.stream = attack_noise
		state_machine.audio_player.play()
	
	await state_machine.anim_player.animation_finished
	
	state_machine.switch_state(exit_state)

func exit():
	state_machine.enemy.hitbox.monitoring = false
	state_machine.anim_player.stop()
