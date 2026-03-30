extends EnemyStateMachine
class_name MinotaurStateMachine

@export var dead_state: State

func _on_scan_area_body_entered(body):
	if body is Player and current_state != find_child("MoveState") and current_state != dead_state:
		#print(target)
		target = body
		#print(target.name)
		switch_state(find_child("MoveState"))
