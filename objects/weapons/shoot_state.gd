extends State
class_name ShootState

@export var projectile: Resource

func enter():
	spawn_bullet(projectile)
	
func spawn_bullet(projectile):
	var space_state = state_machine.weapon_slot.get_world_3d().direct_space_state
	var origin_pos: Vector2 = get_viewport().size / 2
	
	var to = state_machine.player.camera.project_ray_origin(origin_pos)
	var from = to + state_machine.player.camera.project_ray_normal(origin_pos) * 25
	
	var new_bullet = projectile.instantiate()
	new_bullet.position = state_machine.weapon_slot.global_position
	get_tree().root.get_child(0).add_child(new_bullet)
	
	new_bullet.look_at(from)
	new_bullet.move(from)
	
	state_machine.switch_state(state_machine.find_child("RecoverState"))
