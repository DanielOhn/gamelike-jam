extends Enemy
class_name HarpyEnemy

@onready var hitbox = find_child("Hitbox")

func _ready():
	hitbox.monitoring = false


func _on_hitbox_body_entered(body):
	if body is Player:
		body.hurt(damage)
		
