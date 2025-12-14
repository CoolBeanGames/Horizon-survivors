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

func _ready() -> void:
	await get_tree().process_frame
	player_refernce = REFS.read("player")
	
	#register with data
	if DATA.exists("enemies"):
		DATA.read("enemies").append(self)
	else:
		DATA.write("enemies",[self])


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions
	if player_refernce == null:
		return
	
	var direction := (player_refernce.global_position - global_position).normalized().x
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func kill():
	DATA.read("enemies").erase(self)
	queue_free()

func damage(dmg : int):
	hp -= dmg
	if hp <= 0:
		kill()
