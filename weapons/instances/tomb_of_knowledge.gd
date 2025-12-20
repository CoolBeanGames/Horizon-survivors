##script written by Dustin Booher
#purpose: a weapon that just increases your gained XP
##created: 12/20/25
##last edited: 12/20/25
class_name tomb_of_knowledge
extends weapon

@export var xp_mult : float

func fire(_plr : player , _enm : enemy, _dir : Vector2):
	pass

func increase_stats(new_lvl : int):
	match new_lvl:
		2:
			xp_mult = 1.5
		3:
			xp_mult = 2
		4:
			xp_mult = 3
		5:
			xp_mult = 5
