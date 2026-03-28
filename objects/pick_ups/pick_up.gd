extends Area3D
class_name Pickup

@export var timer: Timer
var direction: int = 1

func _ready():
	timer.timeout.connect(_on_timer_timeout)

func pickup_effect(player: Player):
	pass

func _on_body_entered(body):
	if body is Player:
		pickup_effect(body)
		
func _physics_process(delta):
	position += Vector3.UP * direction * delta * .2
	rotation.y += delta * .2
		
func _on_timer_timeout():
	direction = direction * -1
