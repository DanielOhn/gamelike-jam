extends State
class_name GargoyleFireState

@export var fireball: Resource
@export var fireball_cooldown: Timer

func enter():
	#state_machine.switch_state(GargoyleIdle)
	fireball_cooldown.start()
	

func spawn_fireball():
	var direction = (state_machine.target.position - state_machine.enemy.position).normalized()
	var new_bullet = fireball.instantiate()
	new_bullet.position = state_machine.enemy.position
	get_tree().root.get_child(0).add_child(new_bullet)
	
	new_bullet.look_at(direction)
	new_bullet.direction = direction
	
func _on_fire_cooldown_timeout():
	spawn_fireball()

func physics_update(_delta: float):
	state_machine.enemy.look_at(Vector3(state_machine.target.position.x, 1, state_machine.target.position.z))
