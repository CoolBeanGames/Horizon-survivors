##script written by Dustin Booher
#purpose: general enemy manager
##created: 12/14/25
##last edited: 12/14/25
class_name enemy
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


@export var hp : int = 5
@export var player_refernce : player
@export var shape : CollisionShape2D
@export var dead : bool = false
@export var flipped : bool = false
@export var sprite : Node2D
@export var death_sound : AudioStream = null
@export var bonk_area : Node2D
@export var death_explision : PackedScene
@export var xp_to_drop : int = 1

func _ready() -> void:
	await get_tree().process_frame
	sprite.play("default")
	player_refernce = REFS.read("player")
	
	#register with data
	if DATA.exists("enemies"):
		DATA.read("enemies").append(self)
	else:
		DATA.write("enemies",[self])


func _physics_process(delta: float) -> void:
	if dead:
		rotate(deg_to_rad(10))
		velocity += get_gravity() * delta
		velocity.x = 0
		move_and_slide()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions
	if player_refernce == null:
		return
	
	var direction := (player_refernce.global_position - global_position).normalized().x
	flipped = sign(direction) == 1
	sprite.flip_h = flipped
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func kill():
	DATA.read("enemies").erase(self)
	set_collision_mask_value(1,false)
	set_collision_mask_value(3,false)
	set_collision_layer_value(2,false)
	set_collision_layer_value(24,true)
	velocity.y -= 500
	get_tree().create_timer(2).timeout.connect(destroy)
	dead = true
	if death_sound != null:
		AUDIO.play_audio(death_sound,0.5)
	if bonk_area!=null:
		bonk_area.queue_free()
	var exp : Node2D = death_explision.instantiate()
	SCENE.scene_root.add_child(exp)
	exp.global_position = global_position
	player_refernce.gain_xp(xp_to_drop)

func damage(dmg : int):
	hp -= dmg
	if hp <= 0:
		kill()

func destroy():
	queue_free()
