extends Node3D

@onready var audio_stream_player = $AudioStreamPlayer

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Level.tscn")

func _physics_process(delta):
	if !audio_stream_player.playing:
		audio_stream_player.play()
