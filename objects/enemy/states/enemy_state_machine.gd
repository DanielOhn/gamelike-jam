extends StateMachine
class_name EnemyStateMachine

@onready var target: Player
@onready var enemy: Enemy = get_parent()
@export var anim_player: AnimationPlayer

# Put this in the State Machine as a get states function
# Should iterate through the children and automatically make the dict for each object that uses states

func _ready():
	switch_state(find_child("IdleState"))

func _on_scan_area_body_entered(body):
	if body is Player and current_state != find_child("MoveState"):
		#print(target)
		target = body
		#print(target.name)
		switch_state(find_child("MoveState"))

func get_distance() -> float:
	var distance = enemy.position.distance_to(target.position)
	return distance
