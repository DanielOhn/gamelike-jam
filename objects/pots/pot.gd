extends RigidBody3D
class_name Pot

func _ready():
	contact_monitor = true
	max_contacts_reported = 3

func _physics_process(delta):
	for body in get_colliding_bodies():
		print(get_colliding_bodies())
		print(body.get_parent())
		if body.get_parent().is_in_group("Wall"):
			apply_central_impulse(-body.get_normal() * 2)
	
