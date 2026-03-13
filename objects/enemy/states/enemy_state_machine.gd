extends StateMachine
class_name EnemyStateMachine

@onready var target: Player
@onready var enemy: Enemy = get_parent()
@export var anim_player: AnimationPlayer

@export var start_state: State

# Put this in the State Machine as a get states function
# Should iterate through the children and automatically make the dict for each object that uses states

func _ready():
	switch_state(start_state)


func get_distance() -> float:
	var distance = enemy.position.distance_to(target.position)
	return distance
