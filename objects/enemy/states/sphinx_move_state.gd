extends MoveState
class_name SphinxMoveState

func approach(_delta):
	var direction = (state_machine.target.position - state_machine.enemy.position).normalized()
	if direction:
		state_machine.enemy.velocity.x = direction.x * state_machine.enemy.speed
		state_machine.enemy.velocity.z = direction.z * state_machine.enemy.speed
	
	state_machine.enemy.move_and_slide()
	
	var distance: float = state_machine.get_distance()
	
	if attack_cooldown.is_stopped() and distance < attack_distance:
		state_machine.switch_state(attack_state)
	if distance > 20.0:
		state_machine.switch_state(ready_state)
