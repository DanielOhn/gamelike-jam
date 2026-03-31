extends Node3D
class_name WeaponSlot

@onready var camera: Camera3D = get_parent().find_child("Camera3D")
@onready var weapons: Array = [get_child(0)]

const SKULL_WEAPON = preload("uid://c8koklfjny4mn")
const BOMB_WEAPON = preload("uid://dvp8llu0nldmj")

@onready var ammo_update = $"../UI/Ammo"
@onready var total_ammo_update = $"../UI/TotalAmmo"

var weapon_index: int = 0
var current_weapon: Node3D

@export var view_weapon: ViewWeapon

func _ready():
	current_weapon = weapons[0]

func add_weapon(weapon):
	weapons.append(weapon)
	swap_weapon(weapons.size() - 1)

	
func swap_weapon(dir: int):
	if weapons.size() - 1 == 0:
		return
	
	current_weapon.get_child(1).anim_player.stop()
	
	
	if weapon_index + dir > weapons.size() - 1:
		weapon_index = 0
	elif weapon_index + dir < 0:
		weapon_index = weapons.size() - 1
	else:
		weapon_index += dir
	
	for weap in weapons:
		weap.get_child(1).disable()
	#current_weapon.get_child(1).disable()
	current_weapon = weapons[weapon_index]
	current_weapon.get_child(1).enable()
	
	view_weapon.update_visibility()
	ammo_update.text = str(current_weapon.get_child(1).current_ammo) + " | " + str(current_weapon.get_child(1).total_ammo)
	

func create_weapon(weapon: String):
	var new_weapon
	match weapon:
		"Skull":
			new_weapon = SKULL_WEAPON.instantiate()
			add_child(new_weapon)
			add_weapon(new_weapon)
			
			#new_weapon.position = Vector3(0, 0, .1)
			
		"Bomb":
			new_weapon = BOMB_WEAPON.instantiate()
			add_child(new_weapon)
			add_weapon(new_weapon)
			
			new_weapon.position = Vector3(.12, .11, .4)

func _physics_process(delta):
	if current_weapon.get_child(1).current_state is ReadyState or current_weapon.get_child(1).current_state is ReloadState:
		if Input.is_action_just_pressed("swap_up"):
			swap_weapon(1)
		
		if Input.is_action_just_pressed("swap_down"):
			swap_weapon(-1)
	ammo_update.text = str(current_weapon.get_child(1).current_ammo)
	if current_weapon.name == "Wand":
		total_ammo_update.text = ""
	else:
		total_ammo_update.text = str(current_weapon.get_child(1).total_ammo)
