extends State
class_name ReadyState

@export var reload_state: State
@export var anim_text: String

func enter() -> void:
	state_machine.anim_player.stop()
	state_machine.anim_player.play(anim_text)

func physics_update(_delta: float) -> void:
	if reload_state:
		if state_machine.current_ammo <= 0:
			state_machine.switch_state(reload_state)
			
		if Input.is_action_just_pressed("reload"):
			state_machine.switch_state(reload_state)
