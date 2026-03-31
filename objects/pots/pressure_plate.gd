extends Area3D

@export var gate: Gate 
var starting_pos: Vector3
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	starting_pos = position

func drop_plate():
	var drop_tween: Tween = create_tween()
	drop_tween.tween_property(self, "position:y", starting_pos.y - .08, .5)
	
	gate.drop()

func lift_plate():
	var lift_tween: Tween = create_tween()
	lift_tween.tween_property(self, "position:y", starting_pos.y, .5)
	
	gate.reset()

func _on_body_entered(body):
	if body is Pot:
		drop_plate()
		audio_player.play()

func _on_body_exited(body):
	if body is Pot:
		lift_plate()
