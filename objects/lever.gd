extends Area3D

@export var pot: Pot
var player_inrange: bool = false
@export var anim_player: AnimationPlayer
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_inrange:
		if Input.is_action_just_pressed("pull_lever"):
			anim_player.play("LeverRig|PullLever")
			pot.reset()
			audio_player.play()


func _on_body_entered(body):
	if body is Player:
		player_inrange = true



func _on_body_exited(body):
	if body is Player:
		player_inrange = false
