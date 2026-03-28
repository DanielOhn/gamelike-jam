extends State
class_name BeamAttack

var fire_beam: bool = false
@export var beam_cooldown: Timer
@export var laser_beam: Node3D
@onready var checker = $"../../skull-weapon/Checker"

func _ready():
	beam_cooldown.wait_time = state_machine.fire_rate

func shoot_beam():
	laser_beam.visible = true
	
	var space_state = state_machine.weapon_slot.get_world_3d().direct_space_state
	var origin_pos: Vector2 = get_viewport().size / 2
	
	var from = state_machine.player.camera.project_ray_origin(origin_pos)
	var to = from + state_machine.player.camera.project_ray_normal(origin_pos) * 25
	var query = PhysicsRayQueryParameters3D.create(from, to)
	
	var result = space_state.intersect_ray(query)
	
	laser_beam.scale.z = 100
	laser_beam.look_at(to)
	checker.position = from
	
	if result:
		var collide = result["collider"]
		if beam_cooldown.is_stopped() and collide is Enemy:
			collide.hurt(state_machine.beam_damage, state_machine.player.position)
			beam_cooldown.start()
		


func enter():
	state_machine.anim_player.play("Attack")
	await state_machine.anim_player.animation_finished
	state_machine.anim_player.play("Attacking")
	fire_beam = true
	
func physics_update(_delta: float) -> void:
	if fire_beam:
		shoot_beam()
	
	
func exit():
	laser_beam.visible = false
	fire_beam = false
	state_machine.anim_player.play("EndAttack")
	await state_machine.anim_player.animation_finished
	
