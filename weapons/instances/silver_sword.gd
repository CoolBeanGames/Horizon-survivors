##script written by Dustin Booher
#purpose: a simple melee weapon that just shoots a bullet
##created: 12/14/25
##last edited: 12/25/25
class_name test_melee
extends weapon

var number_of_slashes = 1 #how many times to slash
var size_mult = 1.0      #the world scale size for the slash

#called when fire
func fire(plr : player , enm : enemy, _dir : Vector2):
	if enm != null:
		spawn_sword_slash(plr)
		if number_of_slashes > 1:
			plr.get_tree().create_timer(0.45).timeout.connect(func(): spawn_sword_slash(plr))

#reusable script to spawn a sword slash
func spawn_sword_slash(plr : player):
	play_audio()
	var instance : Node2D = effect.instantiate()
	plr.get_tree().root.add_child(instance)
	instance.global_scale = Vector2(size_mult,size_mult) #scale it based on current size value
	instance.global_position = plr.global_position + Vector2(plr.facing_direction * 200,0)
	instance.setup(plr.facing_direction,damage)

#level up silver sword
func increase_stats(new_lvl : int):
	match new_lvl:
		2:
			cool_down -= 0.5
		3:
			damage += 2
		4:
			number_of_slashes += 1
		5:
			size_mult = 1.5
			cool_down = 1
