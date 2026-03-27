extends Node3D
class_name WeaponSlot

@onready var camera: Camera3D = get_parent().find_child("Camera3D")
@onready var weapons: Array = [get_child(0)]

const SKULL_WEAPON = preload("uid://c8koklfjny4mn")


var weapon_index: int = 0
var current_weapon: Node3D

func _ready():
	current_weapon = weapons[0]
	print("Current Weapon: ", current_weapon)

func add_weapon(weapon):
	weapons.append(weapon)
	swap_weapon(weapons.size() - 1)

	
func swap_weapon(dir: int):
	if weapons.size() - 1 == 0:
		return
	
	if weapon_index + dir > weapons.size() - 1:
		weapon_index = 0
	elif weapon_index + dir < 0:
		weapon_index = weapons.size() - 1
	else:
		weapon_index += dir
	
	print("Swapping Weapon" , current_weapon, weapons[weapon_index])
	current_weapon.get_child(1).disable()
	current_weapon = weapons[weapon_index]
	current_weapon.get_child(1).enable()
	

func create_weapon(weapon: String):
	var new_weapon
	match weapon:
		"Skull":
			new_weapon = SKULL_WEAPON.instantiate()
			add_child(new_weapon)
			add_weapon(new_weapon)
			
			new_weapon.scale = Vector3(.05, .05, .05)
			new_weapon.position = Vector3(0, 0, .1)

func _physics_process(delta):
	if Input.is_action_just_pressed("swap_up"):
		swap_weapon(1)
	
	if Input.is_action_just_pressed("swap_down"):
		swap_weapon(-1)
