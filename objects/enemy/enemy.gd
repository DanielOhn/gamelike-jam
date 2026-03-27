extends CharacterBody3D
class_name Enemy

@export var speed: float = 3.2
@export var health: float = 24.0
@export var damage: float = 5

@export var state_machine: EnemyStateMachine
@export var hurt_state: State

#func _ready():
	#hitbox.monitoring = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta



		
func hurt(dmg: float, pos: Vector3):
	look_at(pos)
	health = health - dmg
	if health <= 0:
		print_debug(self, "Dead")
		queue_free()
	else:
		state_machine.switch_state(hurt_state)
