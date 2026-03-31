extends Pickup

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var collision_shape: CollisionShape3D = $CollisionShape3D

func pickup_effect(player: Player):
	for weapon in player.weapon_slot.weapons:
		weapon.get_child(1).add_ammo(50)
		
		audio_stream_player.playing = true
		visible = false
		collision_shape.disabled = true
		
		await audio_stream_player.finished
		queue_free()
