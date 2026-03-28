extends Area3D
class_name Bomb

@onready var upward_timer = $UpwardTimer
var direction: Vector3 = Vector3.ZERO
@export var speed: float = 12

func _physics_process(delta):
	if upward_timer.is_stopped():
		position += (Vector3.DOWN + direction) * delta * speed
	else:
		position += (direction + Vector3.UP) * speed *  delta 
	
func explode():
	print("KABOOM")
	queue_free()

func _on_body_entered(body):
	if body is not Player:
		explode()
