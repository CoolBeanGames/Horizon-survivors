##script written by Dustin Booher
#purpose: the visual effect for an explosion object
##created: 12/20/25
##last edited: 12/20/25
class_name explosion_effect
extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("default")


func _on_timer_timeout() -> void:
	queue_free()
