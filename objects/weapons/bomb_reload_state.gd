extends ReloadState

@export var bomb: MeshInstance3D

func refill_ammo():
	state_machine.total_ammo -= state_machine.max_clip - state_machine.current_ammo
	state_machine.current_ammo = state_machine.max_clip
	
	bomb.visible = true
	
