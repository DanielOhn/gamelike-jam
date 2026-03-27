extends State
class_name DisabledState


func enter() -> void:
	state_machine.get_parent().visible = false
	state_machine.disabled = true

func exit():
	state_machine.get_parent().visible = true
	state_machine.disabled = false
