extends State
class_name GargoyleIdle


func physics_update(_delta: float) -> void:
	if state_machine.target != null and state_machine.enemy:
		var direction: Vector3 = Vector3(state_machine.target.position.x, 1, state_machine.target.position.z)
		state_machine.enemy.look_at(direction)
