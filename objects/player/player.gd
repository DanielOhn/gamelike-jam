extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var mouse_sensitivty: float = .1

@onready var weapon_slot: WeaponSlot = $WeaponSlot
@onready var camera: Camera3D = $Camera3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if event is InputEventMouseMotion:
		var MouseEvent = event.relative * get_physics_process_delta_time()
		rotation.x -= MouseEvent.y * mouse_sensitivty
		rotation.y -= MouseEvent.x * mouse_sensitivty
		rotation.x = clamp(rotation.x, -.5, .6)
		
		#rotation_object_local(Vector3(0, 1, 0), -rotation.x)
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == 1 or event.is_pressed() and event.button_index == 1:
			weapon_slot.shoot_gun()


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
