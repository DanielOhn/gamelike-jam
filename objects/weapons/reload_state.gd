extends State
class_name ReloadState

@export var ready_state: State
@export var reload_anim: String

func refill_ammo():
	if state_machine.weapon_slot.current_weapon.name != "Wand":
		state_machine.total_ammo -= state_machine.max_clip - state_machine.current_ammo
		state_machine.total_ammo = clamp(state_machine.total_ammo, 0, state_machine.ammo_capacity)
	state_machine.current_ammo = state_machine.max_clip
	
	

func swap_state():
	state_machine.switch_state(ready_state)

func enter():
	state_machine.anim_player.play(reload_anim)
	

func exit():
	state_machine.anim_player.stop()
