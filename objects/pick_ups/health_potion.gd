extends Pickup
class_name HealthPotion

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var collision_shape: CollisionShape3D = $Area3D

func pickup_effect(player: Player):
	player.health += 40
	player.health = clamp(player.health, 0, 100)
	player.health_bar.value = player.health
	player.check_avatar()
	
	
	audio_stream_player.playing = true
	visible = false
	collision_shape.disabled = true
		
	await audio_stream_player.finished
	queue_free()
