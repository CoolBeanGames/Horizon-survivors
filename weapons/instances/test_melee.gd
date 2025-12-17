##script written by Dustin Booher
#purpose: a simple melee weapon that just shoots a bullet
##created: 12/14/25
##last edited: 12/14/25
class_name test_melee
extends weapon



func fire(plr : player , enm : enemy, dir : Vector2):
	if enm != null:
		play_audio()
		var instance = effect.instantiate()
		plr.get_tree().root.add_child(instance)
		instance.global_position = plr.global_position + Vector2(plr.facing_direction * 200,0)
		instance.setup(dir,damage)
