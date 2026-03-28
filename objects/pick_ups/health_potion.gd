extends Pickup
class_name HealthPotion

func pickup_effect(player: Player):
	player.health += 20
	player.health = clamp(player.health, 0, 100)
	queue_free()
