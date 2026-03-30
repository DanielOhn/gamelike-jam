extends Area3D

@export var box_animation: AnimationPlayer

func _on_body_entered(body):
	box_animation.play("boxopen")
	
	await box_animation.animation_finished
	get_tree().change_scene_to_file("res://scenes/win_screen.tscn")
