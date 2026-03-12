extends StateMachine
class_name PlayerStateMachine

@onready var player: Player = get_parent()


func _ready():
	switch_state(find_child("Play"))
