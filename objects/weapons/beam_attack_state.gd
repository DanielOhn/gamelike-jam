extends State
class_name BeamAttack

var fire_beam: bool = false
@export var beam_cooldown: Timer
@export var laser_beam: RayCast3D

func _ready():
	beam_cooldown.wait_time = state_machine.fire_rate

func shoot_beam():
	

	laser_beam.force_raycast_update()
	if laser_beam.is_colliding():
		var cast_point = laser_beam.to_local(laser_beam.get_collision_point())
		laser_beam.get_child(0).mesh.height = cast_point.y
		laser_beam.get_child(0).position.y = cast_point.y / 2
		
		var collide = laser_beam.get_collider()
	
		if beam_cooldown.is_stopped() and collide is Enemy:
			laser_beam.visible = true
			collide.hurt(state_machine.beam_damage, state_machine.player.position)
			
	if beam_cooldown.is_stopped():
		state_machine.current_ammo -= 2
		beam_cooldown.start()


func enter():
	if state_machine.current_ammo > 0:
		state_machine.anim_player.play("Attack")
		await state_machine.anim_player.animation_finished
		state_machine.anim_player.play("Attacking")
		fire_beam = true
	
func physics_update(_delta: float) -> void:
	if state_machine.current_ammo > 0:
		if fire_beam:
			shoot_beam()
	else:
		state_machine.anim_player.play("EndAttack")
		state_machine.switch_state(state_machine.find_child("ReadyState"))
	
	
func exit():
	laser_beam.visible = false
	fire_beam = false
	state_machine.anim_player.play("EndAttack")
	await state_machine.anim_player.animation_finished
	
