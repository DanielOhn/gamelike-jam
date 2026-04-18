extends State
class_name MoveState

@export var attack_cooldown: Timer

@export var attack_state: State
@export var ready_state: State
@export var anim_text: String
@export var attack_distance: float

@export var move_noise: Resource
#@onready var state_machine = get_parent()
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func approach(_delta):
	var direction = (state_machine.target.position - state_machine.enemy.position).normalized()
	if direction:
		state_machine.enemy.velocity.x = direction.x * state_machine.enemy.speed
		state_machine.enemy.velocity.z = direction.z * state_machine.enemy.speed
		
		if !state_machine.audio_player.playing:
			state_machine.audio_player.stream = move_noise
			state_machine.audio_player.play()
	
	state_machine.enemy.move_and_slide()
	
	var distance: float = state_machine.get_distance()
	
	if attack_cooldown.is_stopped() and distance < attack_distance:
		state_machine.switch_state(attack_state)
	if distance > 20.0:
		state_machine.switch_state(ready_state)


func enter():
	state_machine.anim_player.play(anim_text)


func physics_update(_delta):
	if state_machine.target is Player:
		
		state_machine.enemy.look_at(state_machine.target.position)
		approach(_delta)
