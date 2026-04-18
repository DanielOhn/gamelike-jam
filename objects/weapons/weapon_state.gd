extends StateMachine
class_name WeaponStateMachine

@export var current_ammo: int = 8
@export var max_clip: int = 8
@export var total_ammo: int = INF
@export var ammo_capacity: int = INF


@onready var player = get_parent().get_parent().get_parent()
@onready var weapon_slot: WeaponSlot = get_parent().get_parent()

@export var anim_player: AnimationPlayer
@export var start_state: State
@export var fire_state: State
@export var disable_state: State

var disabled: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	switch_state(start_state)
	
func enable():
	switch_state(start_state)

func disable():
	switch_state(disable_state)
	
func add_ammo(amount: int):
	
	total_ammo += amount
	total_ammo = clamp(total_ammo, 0, ammo_capacity)


func _input(event):
	if !disabled:
		if event is InputEventMouseMotion:
			var MouseEvent = event.relative * get_physics_process_delta_time()
			player.rotation.x -= MouseEvent.y * player.mouse_sensitivty
			player.rotation.y -= MouseEvent.x * player.mouse_sensitivty
			player.rotation.x = clamp(player.rotation.x, -.5, .8)
			
			#rotation_object_local(Vector3(0, 1, 0), -rotation.x)
		if event is InputEventMouseButton and current_state == start_state and current_ammo > 0:
			if event.pressed and event.button_index == 1 or event.is_pressed() and event.button_index == 1:
				switch_state(fire_state)
