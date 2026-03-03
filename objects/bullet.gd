extends Area3D

@export var damage: float = 5.0

func move(pos):
	var move_tween: Tween = create_tween()
	move_tween.tween_property(self, "position", pos, 2.5)
	await move_tween.finished
	
	queue_free()


func _on_body_entered(body):
	if (!body.is_in_group("Player")):
		queue_free()
