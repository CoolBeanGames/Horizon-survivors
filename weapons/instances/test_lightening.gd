extends Node2D


func setup(damage : int, enm : enemy):
	enm.damage(damage)

func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
