class_name explosion_effect
extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("default")


func _on_timer_timeout() -> void:
	queue_free()
