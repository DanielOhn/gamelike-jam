extends State
class_name ChargeState
@onready var cooldown_timer: Timer = $ChargeCooldown
@export var charge_time: float = 4


func _ready():
	cooldown_timer.wait_time = charge_time
# Called when the node enters the scene tree for the first time.
func charge() -> void:
	cooldown_timer.start()
	var charge_tween: Tween = create_tween()
	
	charge_tween.tween_property(state_machine.enemy, "rotation:x", state_machine.enemy.rotation.x - PI / 8, .8)
	charge_tween.tween_property(state_machine.enemy, "position", state_machine.target.position, .6)
	
	await charge_tween
	
	
func enter() -> void:
	if cooldown_timer.is_stopped():
		await charge()
		state_machine.switch_state(state_machine.find_child("MoveState"))
	else:
		state_machine.switch_state(state_machine.find_child("MoveState"))
	print(cooldown_timer.is_stopped())
