class_name test_gun
extends weapon



func fire(plr : player , enm : enemy, dir : Vector2):
	if enm != null:
		var instance = effect.instantiate()
		plr.get_tree().root.add_child(instance)
		instance.global_position = plr.global_position
		instance.setup(dir,damage)
