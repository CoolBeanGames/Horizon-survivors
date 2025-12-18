class_name bomb
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export  var explosion_prefab : PackedScene
@export var damage : int

func setup(dmg : int) -> void:
	velocity.x = SPEED * sign(randi_range(-1,1)) * randf_range(1.25,2.5)
	velocity.y = JUMP_VELOCITY * randf_range(0.8,1.7)
	damage = dmg

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()


#handle the explosion
func _on_area_2d_body_entered(_body: Node2D) -> void:
	print("bomb hit: " , _body.name)
	var instance : explosion = explosion_prefab.instantiate()
	SCENE.scene_root.add_child.call_deferred(instance)
	instance.global_position = global_position
	instance.setup(damage)
	queue_free()
