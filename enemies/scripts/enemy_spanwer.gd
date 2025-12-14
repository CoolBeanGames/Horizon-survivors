class_name enemy_spawner
extends Node2D

var spawn_time : float = 0
@export var ene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_time = randf_range(2,5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !is_on_screen():
		spawn_time -= delta
		if spawn_time <= 0:
			spawn_time = randf_range(2,5)
			spawn()

func is_on_screen() -> bool:
	var rect := get_viewport().get_visible_rect()
	return rect.has_point(global_position)

func spawn():
	var instance = ene.instantiate()
	get_tree().root.add_child(instance)
	instance.global_position = global_position
