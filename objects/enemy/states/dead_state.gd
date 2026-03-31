extends State
class_name DeadState

@export var skeleton: PhysicalBoneSimulator3D
@export var collision_box: CollisionShape3D
@export var timer: Timer

@export var death_noise: Resource

func _ready():
	timer.connect("timeout", _on_timer_timeout)
	timer.wait_time = 5

func enter():
	if skeleton:
		skeleton.active = true
		skeleton.physical_bones_start_simulation()
	else:
		disappear()
		
	timer.start()
	collision_box.disabled = true
	
	if death_noise:
		state_machine.audio_player.stream = death_noise
		state_machine.audio_player.play()

func disappear():
	var vanish_tween: Tween = create_tween()
	vanish_tween.tween_property(state_machine.enemy, "position:y", state_machine.enemy.position.y - 4, 5)

func _on_timer_timeout():
	state_machine.enemy.queue_free()
