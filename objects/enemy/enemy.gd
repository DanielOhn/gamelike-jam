extends CharacterBody3D
class_name Enemy

@export var speed: float = 3.2
@export var health: float = 24.0
@export var damage: float = 5

@export var state_machine: EnemyStateMachine
@export var hurt_state: State
@export var dead_state: State


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
func hurt(dmg: float, pos: Vector3):
	if health <= 0:
		#queue_free()
		if state_machine.anim_player:
			state_machine.anim_player.stop()
		state_machine.switch_state(dead_state)
	else:
		look_at(pos)
		health = health - dmg
		state_machine.switch_state(hurt_state)
