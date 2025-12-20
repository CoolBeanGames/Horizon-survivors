##script written by Dustin Booher
#purpose: the visual and physical representation for melee attacks
##created: 12/20/25
##last edited: 12/20/25
class_name melee_area
extends Node2D

var damage: float
@export var sprite : AnimatedSprite2D

func setup(dir : int, dam: float):
	damage = dam
	call_deferred("_check_initial_overlap")
	sprite.play("default")
	sprite.flip_h = sign(dir) == -1

func _check_initial_overlap():
	$Area2D.force_update_transform()
	var bodies = $Area2D.get_overlapping_bodies()
	for b in bodies:
		if b.is_in_group("enemy"):
			b.damage(damage)

func _on_timer_timeout() -> void:
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.damage(damage)
