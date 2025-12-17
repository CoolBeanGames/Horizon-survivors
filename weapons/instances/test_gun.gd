##script written by Dustin Booher
#purpose: a simple gun that just shoots a bullet
##created: 12/14/25
##last edited: 12/14/25
class_name test_gun
extends weapon



func fire(plr : player , enm : enemy, dir : Vector2):
	if enm != null:
		var instance = effect.instantiate()
		plr.get_tree().root.add_child(instance)
		instance.global_position = plr.global_position
		instance.setup(dir,damage)
		play_audio()
