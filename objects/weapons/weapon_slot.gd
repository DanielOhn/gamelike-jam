extends Node3D
class_name WeaponSlot

@onready var camera: Camera3D = get_parent().find_child("Camera3D")
enum WeaponStates {READY, RECOVER, RELOAD}
const BULLET = preload("uid://bgs4rcft7meu7")

var WeaponState: WeaponStates = WeaponStates.READY

func switch_states(new_state):
	#if WeaponState:
		#WeaponState.exit()
		#
	WeaponState = new_state
	#WeaponState.enter()
	
	
