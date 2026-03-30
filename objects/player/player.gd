extends CharacterBody3D
class_name Player

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var health_update = $PlayerUI/VBoxContainer/HBoxContainer/HealthUpdate

@export var health: float = 100
@export var mouse_sensitivty: float = .1

@onready var weapon_slot: WeaponSlot = $WeaponSlot
@onready var camera: Camera3D = $Camera3D
@onready var immune_timer: Timer = find_child("ImmuneTimer")
@onready var state_machine = $PlayerStateMachine

func hurt(damage):
	if !state_machine.immune:
		health -= damage
		state_machine.switch_state(state_machine.find_child("Hurt"))
		
func _physics_process(delta):
	health_update.text = str(health)
	
	for i in get_slide_collision_count():
		var collide = get_slide_collision(i)
		if collide.get_collider() is Pot:
			var pot: Pot = collide.get_collider()
			pot.apply_central_impulse(-collide.get_normal())

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
