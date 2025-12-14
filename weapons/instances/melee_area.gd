extends Node2D

var damage: float

func setup(dir: Vector2, dam: float):
	damage = dam
	call_deferred("_check_initial_overlap")
	$Timer.start(0.5)

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
