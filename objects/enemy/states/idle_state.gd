extends State
class_name IdleState

var current_tween: Tween

func enter():
	idle_animation()

func exit():
	if current_tween:
		current_tween.kill()
		
func idle_animation():
	print(state_machine.anim_player)
	state_machine.anim_player.play("stand")
	

func idle():
	var idle_tween: Tween = create_tween()
	current_tween = idle_tween
	
	idle_tween.tween_property(state_machine.enemy, "scale", Vector3(1.1, 1.1, 1.1), 2)
	idle_tween.tween_property(state_machine.enemy, "scale", Vector3(1, 1, 1), 2)
	
	await idle_tween.finished
	idle_tween.kill()
	idle()

#func look_around():
	#print("LOOK AROUND")
	#
	#var look_tween: Tween = create_tween()
	#current_tween = look_tween
	#
	#look_tween.tween_property(state_machine.enemy, "rotation:y", state_machine.enemy.rotation.y + PI / 2, 4)
	#
	#await look_tween.finished
	#look_tween.kill()
	#
	#idle()
	
