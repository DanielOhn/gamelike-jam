extends State
class_name WindupState

@export var height: float = 8.0
@export var fly_speed: float = 3
@export var exit_state: State
@export var anim_name: String

func enter():
	state_machine.anim_player.play(anim_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_update(_delta: float) -> void:
	var direction = -(state_machine.target.position - state_machine.enemy.position).normalized()
	if direction:
		#state_machine.enemy.velocity.x = direction.x * * fly_speed * _delta
		state_machine.enemy.velocity.z = direction.z * fly_speed 
		state_machine.enemy.velocity.y = direction.y * fly_speed 
	
	state_machine.enemy.move_and_slide()
	state_machine.enemy.look_at(state_machine.target.position)
	
	var distance: float = state_machine.get_distance()
	#print_debug(distance)
	if distance > height:
		state_machine.switch_state(exit_state)
