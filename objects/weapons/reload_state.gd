extends State
class_name ReloadState

func reload_animation():
	var reload_tween: Tween = create_tween()
	var rotate_x: float = state_machine.weapon_slot.rotation.x
	
	reload_tween.tween_property(state_machine.weapon_slot, "rotation:x", rotate_x + PI / 4, 1)
	reload_tween.tween_property(state_machine.weapon_slot, "rotation:x", rotate_x, 1)
	
	await reload_tween.finished
	

func refill_ammo():
	state_machine.current_ammo = state_machine.max_ammo

func enter():
	await reload_animation()
	refill_ammo()
	state_machine.switch_state(state_machine.find_child("ReadyState"))
