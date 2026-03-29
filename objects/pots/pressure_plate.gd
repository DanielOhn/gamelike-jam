extends Area3D

var gate: Node3D 
var starting_pos: Vector3

func _ready():
	starting_pos = position

func drop_plate():
	var drop_tween: Tween = create_tween()
	drop_tween.tween_property(self, "position:y", starting_pos.y - .12, .5)

func lift_plate():
	var lift_tween: Tween = create_tween()
	lift_tween.tween_property(self, "position:y", starting_pos.y, .5)

func _on_body_entered(body):
	if body is Pot:
		drop_plate()

func _on_body_exited(body):
	if body is Pot:
		lift_plate()
