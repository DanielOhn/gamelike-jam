extends EnemyStateMachine

@export var target_found_state: State

func _on_scan_area_body_entered(body):
	if body is Player:
		target = body
		switch_state(target_found_state)
