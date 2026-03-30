extends State
class_name DeadState

@export var skeleton: PhysicalBoneSimulator3D
@export var collision_box: CollisionShape3D
@export var timer: Timer

func _ready():
	timer.connect("timeout", _on_timer_timeout)
	timer.wait_time = 5

func enter():
	if skeleton:
		skeleton.active = true
		skeleton.physical_bones_start_simulation()
		
	timer.start()
	collision_box.disabled = true
		

func _on_timer_timeout():
	state_machine.enemy.queue_free()
