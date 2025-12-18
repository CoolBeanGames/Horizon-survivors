##written by Dustin Booher
##creation date 12/1/25
##last edited   12/14/25
class_name game_preload_state
extends game_state

##called when first entering the state
func on_enter():
	SCENE.scene_load("res://testing_scene.tscn")
	REFS.read("game").setup_weapon_pool()
	pass

#called when exiting the state
func on_exit():
	pass

##called every frame for this state
func on_process():
	pass
