extends Node3D
class_name WeaponSlot

@onready var camera: Camera3D = get_parent().find_child("Camera3D")
enum WeaponStates {READY, RECOVER, RELOAD}
const BULLET = preload("uid://bgs4rcft7meu7")

var WeaponState: WeaponStates = WeaponStates.READY

func switch_states(new_state):
	#if WeaponState:
		#WeaponState.exit()
		#
	WeaponState = new_state
	#WeaponState.enter()

func shoot_gun():
	if WeaponState == WeaponStates.READY:
		spawn_bullet(BULLET)
		switch_states(WeaponStates.RECOVER)
		var shoot_tween: Tween = create_tween()
		shoot_tween.tween_property(self, "rotation_degrees", Vector3(45, 0, 0), .1)
		
		shoot_tween.tween_property(self, "rotation_degrees", Vector3.ZERO, .2)
		await shoot_tween.finished
		switch_states(WeaponStates.READY)
	
	
func spawn_bullet(bullet):
	var space_state = get_world_3d().direct_space_state
	var origin_pos: Vector2 = get_viewport().size / 2
	
	var to = camera.project_ray_origin(origin_pos)
	var from = to + camera.project_ray_normal(origin_pos) * 25
	
	var new_bullet = bullet.instantiate()
	new_bullet.position = global_position
	get_tree().root.get_child(0).add_child(new_bullet)
	
	new_bullet.look_at(from)
	new_bullet.move(from)
