##script written by Dustin Booher
#purpose: controls a standard bullet that moves to the enemy
##created: 12/14/25
##last edited: 12/14/25
class_name bullet
extends CharacterBody2D


@export var SPEED = 300.0
@export var dam : int = 1

func setup(direction : Vector2, damage : int):
	velocity = direction * SPEED
	dam = damage

func _physics_process(_delta: float) -> void:
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		var e : enemy = body
		e.damage(dam)
	queue_free()
