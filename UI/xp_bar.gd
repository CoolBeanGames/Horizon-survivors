##script written by Dustin Booher
#purpose: a simple display for player xp
##created: 12/20/25
##last edited: 12/20/25
class_name xp_bar
extends HBoxContainer

@export var player_ref : player
@export var level_label : Label
@export var progress_bar : ProgressBar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update()
	pass

func update():
	if player_ref == null:
		player_ref = REFS.read("player")
	if player_ref!=null:
		level_label.text = "lv" + str(player_ref.level)
		progress_bar.value = player_ref.xp.x / player_ref.xp.y
