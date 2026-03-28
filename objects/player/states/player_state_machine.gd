extends StateMachine
class_name PlayerStateMachine

@onready var player: Player = get_parent()
var immune: bool = false


func _ready():
	switch_state(find_child("Play"))
