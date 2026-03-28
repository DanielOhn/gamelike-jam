extends ReloadState

@export var bomb: MeshInstance3D

func refill_ammo():
	state_machine.current_ammo = state_machine.max_ammo
	bomb.visible = true
	
