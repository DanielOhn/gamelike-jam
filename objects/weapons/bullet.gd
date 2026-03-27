extends Area3D

@export var damage: float = 3.0

func seek_target(target: Enemy):
	var move_tween: Tween = create_tween()
	move_tween.tween_property(self, "position", target.position, .2)
	await move_tween.finished
	
func move(pos):
	var move_tween: Tween = create_tween()
	move_tween.tween_property(self, "position", pos, 2.5)
	await move_tween.finished
	
	queue_free()


func _on_body_entered(body):
	if (!body.is_in_group("Player")):
		if body is Enemy:
			body.hurt(damage, position)
		queue_free()


func _on_seek_box_body_entered(body):
	if body is Enemy:
		seek_target(body)
