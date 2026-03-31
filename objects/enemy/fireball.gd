extends Area3D

var direction: Vector3
@export var speed: float = 4
@export var damage: float = 8


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += direction * delta * speed

func _on_body_entered(body):
	if body is Player:

		body.hurt(damage)
		queue_free()
	elif body is StaticBody3D:
		queue_free()
