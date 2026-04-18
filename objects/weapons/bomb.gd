extends Area3D
class_name Bomb

@onready var upward_timer = $UpwardTimer
var direction: Vector3 = Vector3.ZERO
@export var speed: float = 10
@export var damage: float = 200

@export var explosion: Area3D
@export var bomb_mesh: Node3D
@export var bomb_collision: CollisionShape3D
@export var anim_player: AnimationPlayer

@export var explosion_hitbox: CollisionShape3D

var exploding: bool = false

func _ready():
	explosion.visible = false

func _physics_process(delta):
	if !exploding:
		if upward_timer.is_stopped():
			position += (Vector3.DOWN + direction) * delta * speed
		else:
			position += (direction + Vector3.UP) * speed *  delta
			
			
func explode():
	exploding = true
	explosion.visible = true
	bomb_mesh.visible = false

	expand_hitbox()
	anim_player.play("Explosion")
	await anim_player.animation_finished
	queue_free()
	
func expand_hitbox():
	var hitbox_tween: Tween = create_tween()
	hitbox_tween.tween_property(explosion_hitbox, "scale", explosion_hitbox.scale * 3.5, .5)
	hitbox_tween.tween_property(explosion_hitbox, "position:y", explosion_hitbox.position.y + 1, .5)

func _on_body_entered(body):
	if body is not Player:
		explode()


func _on_explosion_body_entered(body):
	if body is Enemy:
		body.hurt(damage, position)
