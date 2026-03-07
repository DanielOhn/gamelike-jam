extends State
class_name HurtState


func enter():
	var start_rotation = state_machine.enemy.rotation.x
	var hurt_tween: Tween = create_tween()
	hurt_tween.tween_property(state_machine.enemy, "rotation:x", start_rotation + PI / 4, .1)
	hurt_tween.tween_property(state_machine.enemy, "rotation:x", start_rotation, .12)
	await hurt_tween.finished
	
	if state_machine.target:
		state_machine.switch_state(state_machine.find_child("MoveState"))
	else:
		state_machine.switch_state(state_machine.find_child("IdleState"))
