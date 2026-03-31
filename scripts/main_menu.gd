extends Node3D

@onready var audio_stream_player = $AudioStreamPlayer
@onready var video_stream_player = $Control/VideoStreamPlayer

func _on_play_button_pressed():
	video_stream_player.play()
	audio_stream_player.stop()
	await video_stream_player.finished
	
	get_tree().change_scene_to_file("res://scenes/Level.tscn")

func _physics_process(delta):
	if !audio_stream_player.playing:
		audio_stream_player.play()
		
	if video_stream_player.is_playing():
		if Input.is_action_pressed("ui_cancel"):
			get_tree().change_scene_to_file("res://scenes/Level.tscn")
