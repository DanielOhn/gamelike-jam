extends State
class_name ReloadState

@export var ready_state: State
@export var reload_anim: String

func refill_ammo():
	state_machine.current_ammo = state_machine.max_ammo
	

func swap_state():
	state_machine.switch_state(ready_state)

func enter():
	state_machine.anim_player.play(reload_anim)
	

func exit():
	state_machine.anim_player.stop()
