##script written by Dustin Booher
#purpose: a simple gun that just shoots a bullet
##created: 12/14/25
##last edited: 12/20/25
class_name gun
extends weapon

@export var shots_fired : int = 1
@export var homing_bullets : bool = false

func fire(plr : player , enm : enemy, dir : Vector2):
	if enm != null:
		for s in shots_fired:
			var instance : bullet = effect.instantiate()
			plr.get_tree().root.add_child(instance)
			instance.global_position = plr.global_position
			instance.setup(dir,damage,homing_bullets,enm)
			play_audio()

func increase_stats(new_lvl : int):
	match new_lvl:
		2:
			damage += 1
			cool_down -= 0.25
		3:
			shots_fired += 1
		4:
			damage += 1
			cool_down = .25
		5:
			homing_bullets = true
