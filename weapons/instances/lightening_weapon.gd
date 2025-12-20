##script written by Dustin Booher
#purpose: a simple melee weapon that just shoots a bullet
##created: 12/14/25
##last edited: 12/20/25
class_name test_local
extends weapon



func fire(_plr : player , enm : enemy,_dir : Vector2):
	var enemies : Array = DATA.read("enemies",[])
	if enemies != []:
		enm=enemies[randi_range(0,enemies.size()-1)]
		var instance = effect.instantiate()
		_plr.get_tree().root.add_child(instance)
		instance.global_position = enm.global_position
		instance.setup(damage,enm)
		play_audio()

func increase_stats(new_lvl : int):
	pass
