extends IdleState

@export var timer: Timer
@export var flap_wait: float = 3

func _ready():
	timer.wait_time = flap_wait
	timer.start()

func enter():
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
	

func _on_timer_timeout():
	hover()
