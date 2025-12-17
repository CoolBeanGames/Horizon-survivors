extends Area2D

@export var attached_enemy : enemy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print("on bonk area enter")
	if body.is_in_group("player"):
		var plr : player = body
		var player_has_bonk : bool = false
		var bonk_weapon : bonk = null
		for w in plr.weapons.values():
			print("weapon:", w, "script:", w.get_script())
			print("is bonk?", w is bonk)
			if w is bonk:
				player_has_bonk = true
				bonk_weapon = w
		if player_has_bonk:
			bonk_weapon.bonk(plr,attached_enemy)
