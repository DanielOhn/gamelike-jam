extends Enemy
class_name MinotaurEnemy

@onready var hitbox = find_child("Hitbox")

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
		print_debug(self, "Dead")
		queue_free()
	else:
		state_machine.switch_state(hurt_state)
