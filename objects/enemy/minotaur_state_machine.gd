extends EnemyStateMachine
class_name MinotaurStateMachine

func _on_scan_area_body_entered(body):
	if body is Player and current_state != find_child("MoveState"):
		#print(target)
		target = body
		#print(target.name)
		switch_state(find_child("MoveState"))
