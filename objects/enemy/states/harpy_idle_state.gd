extends IdleState

@export var timer: Timer
@export var flap_wait: float = 3
var starting_pos: Vector3

func _ready():
	timer.wait_time = flap_wait
	#timer.start()
	#starting_pos = state_machine.enemy.position
	
func _on_timer_timeout():
	hover()

func enter():
	starting_pos = state_machine.enemy.position
	if state_machine.target == null:
		idle_animation()
	elif exit_state != null:
		state_machine.switch_state(exit_state)
		
func exit():
	timer.stop()
		
func idle_animation():
	if state_machine.anim_player != null:
		state_machine.anim_player.play(animation)

func hover():
	var hover_tween: Tween = create_tween()
	var starting_position: Vector3 = state_machine.enemy.position
	hover_tween.tween_property(state_machine.enemy, "position", starting_position + Vector3(0, .1, 0), .5)
	hover_tween.tween_property(state_machine.enemy, "position", starting_position - Vector3(0, .1, 0), .5)
	await hover_tween.finished
	

func physics_update(delta: float) -> void:
	
	if state_machine.enemy.position.distance_to(starting_pos) > 6:
		state_machine.enemy.position.lerp(starting_pos)
	else:
		state_machine.enemy.position += Vector3(randf_range(-.2, .2), randf_range(-.2, .2), randf_range(-.2, .2)) * delta
	
