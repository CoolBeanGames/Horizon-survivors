##script written by Dustin Booher
#purpose: throw bombs in a random direction
##created: 12/17/25
##last edited: 12/20/25
class_name bomb_glove
extends weapon

@export var bombs_thrown : int = 1


func fire(plr : player , enm : enemy, dir : Vector2):
	if enm != null:
		for b in bombs_thrown:
			var instance = effect.instantiate()
			plr.get_tree().root.add_child(instance)
			instance.global_position = plr.global_position
			instance.setup(damage)
			play_audio()

func increase_stats(new_lvl : int):
	match  new_lvl:
		2: 
			damage = 4
		3: 
			bombs_thrown += 1
		4: 
			bombs_thrown =+ 2
			damage = 6
		5:
			bombs_thrown += 2
