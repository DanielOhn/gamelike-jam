extends State
class_name PlayerHurtState

var immune: bool = false
@onready var immune_timer = $ImmuneTimer

func knockback():
	var jump_direction = state_machine.player.global_transform.basis.z
	print_debug(jump_direction)
	
	var knockback_tween: Tween = create_tween()
	knockback_tween.tween_property(state_machine.player, "position:y", state_machine.player.position.y + 1, .1)
	#await knockback_tween.finished
	
func enter():
	if immune != true:
		hurt()
		knockback()
		#state_machine.switch_state(state_machine.find_child("Play"))
	state_machine.switch_state(state_machine.find_child("Play"))


func hurt():
	immune_timer.start()
	immune = true
	if state_machine.player.health <= 0:
		print("Game Over")
		get_tree().paused = true

func _on_immune_timer_timeout():
	immune = false
