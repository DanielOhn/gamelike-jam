extends EnemyStateMachine
class_name GargoyleStateMachine


# Called when the node enters the scene tree for the first time.
func _ready():
	switch_state(start_state)

func _on_scan_area_body_entered(body):
	if body is Player:
		target = body
