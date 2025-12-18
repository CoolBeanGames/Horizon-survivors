class_name explosion
extends Node2D

@export var damage : int = 5
var damaged_enemies : Array = []

# Called when the node enters the scene tree for the first time.
func setup(dmg : int) -> void:
	$AnimationPlayer.play("explode")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Area2D.force_update_transform()
	var bodies = $Area2D.get_overlapping_bodies()
	for b in bodies:
		if b.is_in_group("enemy") and !damaged_enemies.has(b):
			b.damage(damage)
			damaged_enemies.append(b)


func _on_timer_timeout() -> void:
	queue_free()
