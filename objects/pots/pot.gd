extends RigidBody3D
class_name Pot

var starting_pos: Vector3
const POT_SLIDING = preload("uid://b5ns66tyeb0i6")
@onready var audio_player = $AudioStreamPlayer

func play_audio():
	audio_player.stream = POT_SLIDING
	audio_player.play()

func _ready():
	contact_monitor = true
	max_contacts_reported = 3
	starting_pos = position
	
func reset():
	position = starting_pos
