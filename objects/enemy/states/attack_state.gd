extends State
class_name AttackState

@onready var mesh_instance_3d = $"../../MeshInstance3D/MeshInstance3D"

func attack():
	var attack_tween = create_tween()
	var start_rotation = mesh_instance_3d.rotation.x
	
	attack_tween.tween_property(mesh_instance_3d, "rotation:x", start_rotation + (PI / 2), .5)
	state_machine.enemy.hitbox.monitoring = true
	attack_tween.tween_property(mesh_instance_3d, "rotation:x", start_rotation, .2)
	await attack_tween.finished
	
	state_machine.enemy.hitbox.monitoring = false

func enter():
	await attack()
	state_machine.switch_state(state_machine.find_child("MoveState"))
