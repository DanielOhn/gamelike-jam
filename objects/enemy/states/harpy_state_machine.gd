extends EnemyStateMachine
class_name HarpyStateMachine


@export var target_found_state: State

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_scan_area_body_entered(body):
	if body is Player and current_state != DeadState:
		target = body
		switch_state(target_found_state)
