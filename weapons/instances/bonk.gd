##script written by Dustin Booher
#purpose: a powerup that allows the player to jump on enemy heads
##created: 12/17/25
##last edited: 12/20/25
class_name bonk
extends weapon



func fire(plr : player , enm : enemy, dir : Vector2):
	if enm != null:
		pass
		

func bonk(plr : player , enm : enemy):
	play_audio()
	print("bonk")
	enm.damage(damage)
	plr.jump()

func increase_stats(new_lvl : int):
	match new_lvl:
		2: 
			damage = 2
		3:
			#TODO: add a shhockwave
			pass
		4:
			damage = 4
			#TODO: addd bigger shockwave code
