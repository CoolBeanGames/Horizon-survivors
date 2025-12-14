##script written by Dustin Booher
#purpose: a world border that should visually fade in / out as the player gets near it
#only becoming visible when the player is close eneough and gradually fading out as
#the move away
##created: 12/14/25
##last edited: 12/14/25
class_name border
extends Sprite2D

@export var player_ref : Node2D = null
@export var goal_distance : float = 5
@export var debug : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	if REFS.exists("player"):
		player_ref = REFS.read("player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	##the player was never set so this does nothing
	if player_ref == null:
		push_warning("WARNING 0w001: player referennce was never set.")
		modulate = Color(1,1,1,0)
		queue_free()
		return
	##the player is valid so gather the distance
	var distance_to_player = (player_ref.global_position - global_position).length()
	if debug:
		print("distance to player: ", distance_to_player)
	##if the player is close eneough start fading
	if distance_to_player < goal_distance:
		var alpha = inverse_lerp(goal_distance, 0.0, distance_to_player)
		if debug:
			print("player within range of border, alpha: " , alpha)
		modulate = Color(1,1,1,alpha)
		return
	modulate = Color(1,1,1,0)
