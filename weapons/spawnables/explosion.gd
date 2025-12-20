##script written by Dustin Booher
#purpose: manager for explosions
##created: 12/20/25
##last edited: 12/20/25
class_name explosion
extends Node2D

@export var damage : int = 5
@export var sound : AudioStream
var damaged_enemies : Array = []

# Called when the node enters the scene tree for the first time.
func setup(_dmg : int) -> void:
	AUDIO.play_audio(sound,0.5)
	$AnimationPlayer.play("explode")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Area2D.force_update_transform()
	var bodies = $Area2D.get_overlapping_bodies()
	print("explosion bodies found: ", bodies.size())
	for b in bodies:
		if b.is_in_group("enemy") and !damaged_enemies.has(b):
			b.damage(damage)
			damaged_enemies.append(b)


func _on_timer_timeout() -> void:
	queue_free()
