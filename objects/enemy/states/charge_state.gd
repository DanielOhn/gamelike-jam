extends State
class_name ChargeState
@onready var cooldown_timer: Timer = $ChargeCooldown
@export var charge_time: float = 1
var charging: bool = false


func _ready():
	cooldown_timer.wait_time = charge_time
	#state_machine.anim_player.animation_finished.connect(_on_anim_stop)

func _on_anim_stop():
	stop_charge()
	
# Called when the node enters the scene tree for the first time.
#func charge() -> void:
	#cooldown_timer.start()
	#state_machine.enemy.hitbox.monitoring = true
	#
	#var charge_tween: Tween = create_tween()
	#
	#charge_tween.tween_property(state_machine.enemy, "position", state_machine.target.position, .8)
	#
	#await charge_tween.finished
	#state_machine.enemy.hitbox.monitoring = false
	#state_machine.anim_player.stop()
	
func charge_impluse() -> void:
	var location = state_machine.target.position - state_machine.enemy.position
	state_machine.enemy.add_impluse(location * 5)
	
func enter() -> void:
	if cooldown_timer.is_stopped():
		state_machine.anim_player.play("CHARGE")
		charging = true
		state_machine.enemy.hitbox.monitoring = true
		cooldown_timer.start()
	else:
		state_machine.switch_state(state_machine.find_child("MoveState"))

func stop_charge():
	state_machine.anim_player.stop()
	state_machine.switch_state(state_machine.find_child("MoveState"))

func physics_update(_delta: float) -> void:
	if charging:
		var direction = (state_machine.target.position - state_machine.enemy.position).normalized()
		if direction:
			state_machine.enemy.velocity.x = direction.x * 8
			state_machine.enemy.velocity.z = direction.z * 8
		
		state_machine.enemy.move_and_slide()
		state_machine.enemy.look_at(state_machine.target.position)
		
		var distance: float = state_machine.get_distance()
		
		if distance < 1.4:
			stop_charge()

func exit():
	charging = false
	state_machine.enemy.hitbox.monitoring = false
	
