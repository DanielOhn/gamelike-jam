extends State
class_name RecoverState

func enter():
	#recover()
	pass

func recover():
	var shoot_tween: Tween = create_tween()
	var rotate_x = state_machine.weapon_slot.rotation.x
	
	shoot_tween.tween_property(state_machine.weapon_slot, "rotation:x", rotate_x + PI / 4, .1)
	
	shoot_tween.tween_property(state_machine.weapon_slot, "rotation:x", rotate_x, .2)
	
	state_machine.switch_state(state_machine.find_child("ReadyState"))
