extends WeaponStateMachine
class_name SkullStateMachine

@export var beam_damage: float = 2.5
@export var fire_rate: float = .25	



func _input(event):
	if !disabled:
		if event is InputEventMouseMotion:
			var MouseEvent = event.relative * get_physics_process_delta_time()
			player.rotation.x -= MouseEvent.y * player.mouse_sensitivty
			player.rotation.y -= MouseEvent.x * player.mouse_sensitivty
			player.rotation.x = clamp(player.rotation.x, -.5, .8)
			
			#rotation_object_local(Vector3(0, 1, 0), -rotation.x)
		if event is InputEventMouseButton and current_state == start_state:
			if event.pressed and event.button_index == 1 or event.is_pressed() and event.button_index == 1:
				switch_state(fire_state)
		elif event is InputEventMouseButton and current_state == fire_state:
			if event.button_index == 1 and event.is_released():
				switch_state(start_state)
