extends Node3D
class_name ViewWeapon

var current_weapon
@export var weapon_slot: WeaponSlot

@onready var wand = $Wand
@onready var skull = $Skull
@onready var bomb = $Bomb

func _ready():
	current_weapon = wand
	
	wand.visible = true
	skull.visible = false
	bomb.visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(2 * delta)

func hide_weapons():
	wand.visible = false
	skull.visible = false
	bomb.visible = false

func update_visibility():
	hide_weapons()
	if weapon_slot.current_weapon.name == "Wand":
		wand.visible = true
	if weapon_slot.current_weapon.name == "SkullWeapon":
		skull.visible = true
	if weapon_slot.current_weapon.name == "BombWeapon":
		bomb.visible = true
