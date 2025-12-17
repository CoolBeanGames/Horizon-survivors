##script written by Dustin Booher
#purpose: spawns enemies at a random interval
##created: 12/14/25
##last edited: 12/14/25
class_name enemy_spawner
extends Node2D

var spawn_time : float = 0
@export var min_time : float = 2
@export var max_time : float = 5
@export var ene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_time = randf_range(min_time,max_time)

func set_time():
	spawn_time = randf_range(min_time,max_time)
	min_time -= randf_range(0,0.02)
	max_time -= randf_range(0,0.03)
	min_time = clamp(min_time,0.2,2)
	max_time = clamp(max_time,0.5,5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !is_on_screen():
		spawn_time -= delta
		if spawn_time <= 0:
			set_time()
			spawn()

func is_on_screen() -> bool:
	var rect := get_viewport().get_visible_rect()
	return rect.has_point(global_position)

func spawn():
	var instance = ene.instantiate()
	get_tree().root.add_child(instance)
	instance.global_position = global_position
