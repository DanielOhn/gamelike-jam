extends Area3D
class_name WeaponPickup

@export var timer: Timer
@export var direction: int = -1
@export var weapon_name: String


func _physics_process(delta):
	position.y += .2 * direction * delta
	rotate_y(1 * delta)

func _on_body_entered(body):
	if body is Player:
		body.weapon_slot.create_weapon(weapon_name)
		queue_free()

func _on_timer_timeout():
	if direction == 1:
		direction = -1
	else:
		direction = 1
