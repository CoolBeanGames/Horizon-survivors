##script written by Dustin Booher
#purpose: a simple melee weapon that just shoots a bullet
##created: 12/14/25
##last edited: 12/25/25
class_name test_local
extends weapon

@export var number_of_bolts : int = 1

func fire(_plr : player , enm : enemy,_dir : Vector2):
	var enemies : Array = DATA.read("enemies",[])
	for i in number_of_bolts:
		if enemies != []:
			enm=enemies[randi_range(0,enemies.size()-1)]
			var instance = effect.instantiate()
			_plr.get_tree().root.add_child(instance)
			instance.global_position = enm.global_position
			instance.setup(damage,enm)
			play_audio()

func increase_stats(new_lvl : int):
	match new_lvl:
		2: number_of_bolts += 1
		3: number_of_bolts += 1
		4: cool_down = 4
		5: 
			number_of_bolts = 5
			cool_down = 3
			damage = 10
			
	pass
