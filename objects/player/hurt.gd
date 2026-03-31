extends State
class_name PlayerHurtState

@onready var immune_timer = $ImmuneTimer

func knockback():
	var jump_direction = state_machine.player.global_transform.basis.z
	
	var knockback_tween: Tween = create_tween()
	knockback_tween.tween_property(state_machine.player, "position:y", state_machine.player.position.y + 1, .1)
	
func enter():
	if state_machine.immune == false:
		hurt()
		knockback()
		#state_machine.switch_state(state_machine.find_child("Play"))
	else:
		state_machine.switch_state(state_machine.find_child("Play"))


func hurt():
	immune_timer.start()
	state_machine.immune = true
	if state_machine.player.health <= 0:
		state_machine.switch_state(state_machine.find_child("GameOver"))
	else:
		state_machine.switch_state(state_machine.find_child("Play"))

func _on_immune_timer_timeout():
	state_machine.immune = false
