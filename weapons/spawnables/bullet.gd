##script written by Dustin Booher
#purpose: controls a standard bullet that moves to the enemy
##created: 12/14/25
##last edited: 12/25/25
class_name bullet
extends CharacterBody2D


@export var SPEED = 750.0
@export var dam : int = 1
@export var sprite : AnimatedSprite2D
@export var homing : bool = false
@export var tracked_enemy : enemy

func setup(direction : Vector2, damage : int, is_homing : bool = false, enm : enemy = null):
	velocity = direction * SPEED
	dam = damage
	sprite.play("default")
	homing = is_homing
	tracked_enemy = enm

func _physics_process(_delta: float) -> void:
	if homing and is_instance_valid(tracked_enemy):
		var to_enemy = (tracked_enemy.global_position - global_position).normalized()
		sprite.rotation = to_enemy.angle()
		velocity = Vector2.RIGHT.rotated(sprite.rotation)
	else:
		if velocity.length() > 0.01:
			sprite.rotation = velocity.angle()
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		var e : enemy = body
		e.damage(dam)
	queue_free()
