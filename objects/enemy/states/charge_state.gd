extends State
class_name ChargeState

@export var cooldown_timer: Timer
@export var charge_time: float = 1
@export var charge_speed: float = 8
@export var anim_text: String
@export var exit_state: State

var charging: bool = false
@export var charge_noise: Resource

func _ready():
	cooldown_timer.wait_time = charge_time
	#state_machine.anim_player.animation_finished.connect(_on_anim_stop)

func _on_anim_stop():
	stop_charge()

	
func enter() -> void:
	if cooldown_timer.is_stopped():
		if anim_text != null:
			state_machine.anim_player.play(anim_text)
			
		charging = true
		state_machine.enemy.hitbox.monitoring = true
		cooldown_timer.start()
		
		state_machine.audio_player.stream = charge_noise
		state_machine.audio_player.play()
	else:
		state_machine.switch_state(exit_state)

func stop_charge():
	state_machine.anim_player.stop()
	state_machine.switch_state(exit_state)

func physics_update(_delta: float) -> void:
	var direction = (state_machine.target.position - state_machine.enemy.position).normalized()
	if direction:
		state_machine.enemy.velocity.x = direction.x * charge_speed
		state_machine.enemy.velocity.z = direction.z * charge_speed
		#state_machine.enemy.velocity.y = direction.y * charge_speed
	
	state_machine.enemy.move_and_slide()
	state_machine.enemy.look_at(state_machine.target.position)
	
	var distance: float = state_machine.get_distance()
	
	if distance < 1.4:
		stop_charge()

func exit():
	charging = false
	state_machine.enemy.hitbox.monitoring = false
	
