extends StateMachine
class_name PlayerStateMachine

@onready var player: Player = get_parent()

@export var sound_player: AudioStreamPlayer
var immune: bool = false


func _ready():
	switch_state(find_child("Play"))
