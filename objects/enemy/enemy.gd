extends CharacterBody3D
class_name Enemy

@export var speed: float = 3.5
@export var health: float = 24.0
@export var damage: float = 5

@onready var hitbox = find_child("Hitbox")
@onready var state_machine: EnemyStateMachine = $EnemyStateMachine

func _ready():
	hitbox.monitoring = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


func _on_hitbox_body_entered(body):
	if body is Player:
		body.hurt(damage)
		
func hurt(dmg: float):
	health = health - dmg
	if health <= 0:
		print("Dead")
		queue_free()
	else:
		state_machine.switch_state(state_machine.find_child("HurtState"))
