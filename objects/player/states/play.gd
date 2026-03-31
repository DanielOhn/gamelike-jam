extends State
class_name PlayState

@export var walk_sound: Resource

# Called when the node enters the scene tree for the first time.
func enter():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_update(_delta: float) -> void:
	if Input.is_action_just_released("ui_cancel"):
		state_machine.switch_state(state_machine.find_child("Pause"))
	
	if not state_machine.player.is_on_floor():
		state_machine.player.velocity += state_machine.player.get_gravity() * _delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and state_machine.player.is_on_floor():
		state_machine.player.velocity.y = state_machine.player.JUMP_VELOCITY

	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (state_machine.player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		state_machine.player.velocity.x = direction.x * state_machine.player.SPEED
		state_machine.player.velocity.z = direction.z * state_machine.player.SPEED
		
		if !state_machine.sound_player.playing and state_machine.player.is_on_floor():
			state_machine.sound_player.stream = walk_sound
			state_machine.sound_player.play()
	else:
		state_machine.player.velocity.x = move_toward(state_machine.player.velocity.x, 0, state_machine.player.SPEED)
		state_machine.player.velocity.z = move_toward(state_machine.player.velocity.z, 0, state_machine.player.SPEED)

	state_machine.player.move_and_slide()
