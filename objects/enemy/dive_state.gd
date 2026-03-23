extends State
class_name DiveState

@export var cooldown_timer: Timer
@export var dive_time: float = 1
@export var dive_speed: float = 8
@export var anim_text: String
@export var exit_state: State


func _ready():
	cooldown_timer.wait_time = dive_time

func _on_anim_stop():
	stop_charge()

func enter() -> void:
	if anim_text != null:
		state_machine.anim_player.play(anim_text)
	state_machine.enemy.hitbox.monitoring = true


func stop_charge():
	state_machine.anim_player.stop()
	state_machine.switch_state(exit_state)

func physics_update(_delta: float) -> void:
	var direction = (state_machine.target.position - state_machine.enemy.position).normalized()
	if direction:
		state_machine.enemy.velocity.x = direction.x * dive_speed
		state_machine.enemy.velocity.z = direction.z * dive_speed
		state_machine.enemy.velocity.y = direction.y * dive_speed
	
	state_machine.enemy.move_and_slide()
	state_machine.enemy.look_at(state_machine.target.position)
	
	var distance: float = state_machine.get_distance()
	
	if distance < 1.8:
		stop_charge()

func exit():
	state_machine.enemy.hitbox.monitoring = false
	
