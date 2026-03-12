extends CharacterBody3D
class_name Player

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var health: float = 25
@export var mouse_sensitivty: float = .1

@onready var weapon_slot: WeaponSlot = $WeaponSlot
@onready var camera: Camera3D = $Camera3D
@onready var immune_timer: Timer = find_child("ImmuneTimer")
@onready var state_machine = $PlayerStateMachine

func hurt(damage):
	health -= damage
	state_machine.switch_state(state_machine.find_child("Hurt"))

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
