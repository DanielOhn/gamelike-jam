extends State
class_name BombAttackState

@export var anim_string: String
@export var exit_state: State
@export var bomb: MeshInstance3D
@export var bomb_projectile: Resource

func enter():
	state_machine.anim_player.play(anim_string)
	await state_machine.anim_player.animation_finished
	bomb.visible = false
	state_machine.current_ammo -= 1
	create_bomb()
	state_machine.switch_state(exit_state)

func create_bomb():
	var new_bomb: Bomb = bomb_projectile.instantiate()

	
	get_tree().root.get_child(0).add_child(new_bomb)
	new_bomb.global_position = state_machine.weapon_slot.global_position
	new_bomb.direction = -state_machine.player.basis.z.normalized()
	
