##script written by Dustin Booher
#purpose: the lightening bolt manager for the lightening weapon
##created: 12/20/25
##last edited: 12/20/25
class_name lightening_manager
extends Node2D

@export var animation_players : Array[AnimatedSprite2D] = []

func _ready() -> void:
	for s in animation_players:
		s.play("default")

func setup(damage : int, enm : enemy):
	enm.damage(damage)

func _on_timer_timeout() -> void:
	queue_free()
