extends State
class_name GargoyleFireState

@export var fireball: Resource
@export var fireball_cooldown: Timer

@export var turn_noise: Resource
@export var shoot_noise: Resource

func enter():
	fireball_cooldown.start()
	state_machine.audio_player.stream = turn_noise
	state_machine.audio_player.play()
	
func exit():
	fireball_cooldown.stop()
	

func spawn_fireball():
	var direction = (state_machine.target.position - state_machine.enemy.position).normalized()
	var new_bullet = fireball.instantiate()
	state_machine.audio_player.stream = shoot_noise
	state_machine.audio_player.play()

	get_tree().root.get_child(0).add_child(new_bullet)
	new_bullet.position = state_machine.enemy.position
	new_bullet.look_at(state_machine.target.position)
	new_bullet.direction = direction
	
	
	
func _on_fire_cooldown_timeout():
	if state_machine.get_distance() < 12:
		spawn_fireball()
	else:
		state_machine.target = null
		state_machine.switch_state(state_machine.start_state)

func physics_update(_delta: float):
	state_machine.enemy.look_at(Vector3(state_machine.target.position.x, 1, state_machine.target.position.z))
