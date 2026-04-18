extends CharacterBody3D
class_name Player

@export var  SPEED: float
const JUMP_VELOCITY = 4.5

@export var health: float = 100
@export var mouse_sensitivty: float = .1

@onready var weapon_slot: WeaponSlot = $WeaponSlot
@onready var camera: Camera3D = $Camera3D
@onready var immune_timer: Timer = find_child("ImmuneTimer")
@onready var state_machine = $PlayerStateMachine

# Avatars
const DEFAULT_AVATAR = preload("uid://ciccamn7ff0r1")
const HURT_AVATAR = preload("uid://brj3vk8hcahfq")

@onready var player_avatar = $UI/TextureRect
@onready var health_bar = $UI/HealthBar
const PLAYER_HURT = preload("uid://cvqd6pc6umb25")

func check_avatar():
	if health > 40:
		player_avatar.texture = DEFAULT_AVATAR
	else:
		player_avatar.texture = HURT_AVATAR

func hurt(damage):
	if !state_machine.immune:
		health -= damage
		state_machine.switch_state(state_machine.find_child("Hurt"))
		health_bar.value = health
		check_avatar()
		
		state_machine.sound_player.stream = PLAYER_HURT
		state_machine.sound_player.play()
		
func _physics_process(delta):
	
	for i in get_slide_collision_count():
		var collide = get_slide_collision(i)
		if collide.get_collider() is Pot:
			var pot: Pot = collide.get_collider()
			pot.apply_central_impulse(-collide.get_normal())
			if !pot.audio_player.is_playing():
				pot.play_audio()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	player_avatar.texture = DEFAULT_AVATAR
