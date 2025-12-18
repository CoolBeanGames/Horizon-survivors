##script written by Dustin Booher
#purpose: throw bombs in a random direction
##created: 12/17/25
##last edited: 12/17/25
class_name bomb_glove
extends weapon



func fire(plr : player , enm : enemy, dir : Vector2):
	if enm != null:
		var instance = effect.instantiate()
		plr.get_tree().root.add_child(instance)
		instance.global_position = plr.global_position
		instance.setup(damage)
		play_audio()
