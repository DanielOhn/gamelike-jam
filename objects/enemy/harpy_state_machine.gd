extends EnemyStateMachine
class_name HarpyStateMachine



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_scan_area_body_entered(body):
	if body is Player:
		target = body
		switch_state(find_child("ChargeState"))
