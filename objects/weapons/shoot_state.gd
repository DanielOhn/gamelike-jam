extends State
class_name ShootState

@export var projectile: Resource
@export var anim_name: String
@export var exit_state: State

func enter():
	if state_machine.current_ammo > 0:
		spawn_bullet(projectile)
		state_machine.current_ammo -= 1
		state_machine.anim_player.play(anim_name)
		await state_machine.anim_player.animation_finished
		state_machine.switch_state(exit_state)
		
func spawn_bullet(projectile):
	var space_state = state_machine.weapon_slot.get_world_3d().direct_space_state
	var origin_pos: Vector2 = get_viewport().size / 2
	
	var from = state_machine.player.camera.project_ray_origin(origin_pos)
	var to = from + state_machine.player.camera.project_ray_normal(origin_pos + Vector2(75, 0)) * 25
	
	var new_bullet = projectile.instantiate()
	new_bullet.position = state_machine.weapon_slot.global_position
	get_tree().root.get_child(0).add_child(new_bullet)
	
	new_bullet.look_at(to)
	new_bullet.move(to)
