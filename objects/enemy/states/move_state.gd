extends State
class_name MoveState

#@onready var state_machine = get_parent()
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func approach(_delta):
	var direction = (state_machine.target.position - state_machine.enemy.position).normalized()
	if direction:
		state_machine.enemy.velocity.x = direction.x * state_machine.enemy.speed
		state_machine.enemy.velocity.z = direction.z * state_machine.enemy.speed
	
	state_machine.enemy.move_and_slide()
	
	var distance: float = state_machine.get_distance()
	
	if distance < 2:
		state_machine.switch_state(state_machine.find_child("AttackState"))
	if distance > 5:
		state_machine.switch_state(state_machine.find_child("ChargeState"))
	elif distance > 20.0:
		state_machine.switch_state(state_machine.find_child("IdleState"))


	
func turn_to_player():
	var turn_tween: Tween = create_tween()
	turn_tween.tween_property(state_machine.enemy, "rotation", state_machine.enemy.rotation, 1)
	#turn_tween.tween_property()
	await turn_tween.finished
	
	
func exit():
	#state_machine.target = null
	pass

func physics_update(_delta):
	if state_machine.target != null:
		approach(_delta)
		state_machine.enemy.look_at(state_machine.target.position)
		
