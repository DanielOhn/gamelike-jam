extends StaticBody3D
class_name Gate

var starting_pos: Vector3

func _ready():
	starting_pos = position

func reset():
	var reset_tween: Tween = create_tween()
	reset_tween.tween_property(self, "position:y", starting_pos.y, 1)

func drop():
	var drop_tween: Tween = create_tween()
	drop_tween.tween_property(self, "position:y", position.y - 5, 1)
