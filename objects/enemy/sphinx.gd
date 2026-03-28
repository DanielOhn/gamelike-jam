extends Enemy
class_name SphinxEnemy

@export var hitbox: Area3D

func _ready():
	hitbox.monitoring = false

func _on_hitbox_body_entered(body):
	if body is Player:
		body.hurt(damage)
