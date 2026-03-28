extends State
class_name AttackState

@export var exit_state: State
@export var timer: Timer

func enter():
	
	timer.start()
	state_machine.anim_player.play("metarig|attack")
	state_machine.enemy.hitbox.monitoring = true
	await state_machine.anim_player.animation_finished
	
	state_machine.switch_state(exit_state)

func exit():
	state_machine.enemy.hitbox.monitoring = false
	state_machine.anim_player.stop()
