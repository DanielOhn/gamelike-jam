extends StateMachine
class_name WeaponStateMachine

@export var current_ammo: int = 8
@export var max_ammo: int = 8
@export var ammo_capacity: int = INF


@onready var player = get_parent().get_parent().get_parent()
@onready var weapon_slot = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	switch_state(find_child("ReadyState"))


func _input(event):
	if event is InputEventMouseMotion:
		var MouseEvent = event.relative * get_physics_process_delta_time()
		player.rotation.x -= MouseEvent.y * player.mouse_sensitivty
		player.rotation.y -= MouseEvent.x * player.mouse_sensitivty
		player.rotation.x = clamp(player.rotation.x, -.5, .8)
		
		#rotation_object_local(Vector3(0, 1, 0), -rotation.x)
	if event is InputEventMouseButton and current_state == find_child("ReadyState"):
		if event.pressed and event.button_index == 1 or event.is_pressed() and event.button_index == 1:
			switch_state(find_child("ShootState"))
