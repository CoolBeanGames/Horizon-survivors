##script written by Dustin Booher
#purpose: throw bombs in a random direction
##created: 12/17/25
##last edited: 12/25/25
class_name bomb_glove
extends weapon

@export var bombs_thrown : int = 1
@export var radius : float = 1


func fire(plr : player , enm : enemy, _dir : Vector2):
	if enm != null:
		for b in bombs_thrown:
			var instance : Node2D = effect.instantiate()
			plr.get_tree().root.add_child(instance)
			instance.global_scale = Vector2(radius,radius)
			#TODO change this to actually update the radius rather than just scale up
			instance.global_position = plr.global_position
			instance.setup(damage)
			play_audio()

func increase_stats(new_lvl : int):
	match  new_lvl:
		2: 
			radius = 1.3
		3: 
			bombs_thrown += 1
		4: 
			cool_down -= 2
		5:
			bombs_thrown += 3
