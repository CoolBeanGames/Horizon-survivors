##script written by Dustin Booher
#purpose: this script manages the level up UI that gets called up when the
#player gains a level, it allows the platyer to choose a new weapon
#or level up an existing one
##created: 12/20/25
##last edited: 12/20/25
class_name level_up_ui
extends CanvasLayer

@export var panels : Array[level_up_panel]

##setup all the data in the panels
func setup(wpns : Array[weapon]):
	panels[0].setup(wpns[0])
	panels[0].clicked.connect(selection_made)
	panels[1].setup(wpns[1])
	panels[1].clicked.connect(selection_made)
	panels[2].setup(wpns[2])
	panels[2].clicked.connect(selection_made)
	

##a selection has been made
func selection_made(wpn : weapon):
	print("Selection made")
	var plr : player = REFS.read("player", null)
	if plr != null:
		##the player already has the weapon so level it up
		if  plr.weapons.has(wpn.weapon_name):
			var key = plr.weapons.find_key(wpn)
			var max_level = plr.weapons[key].level_up()
			
			##the weapon is at max level so remove it from the list
			##for future upgrades
			if max_level:
				var wl : Array[weapon] = DATA.read("weapon_pool",[])
				if wl.size() > 0 and wl.has(wpn):
					wl.erase(wpn)
					DATA.write("weapon_pool",wl)
		else:
			##the player does NOT already have the weapon so
			##add it to their list
			plr.weapons[wpn.weapon_name] = wpn
	get_tree().paused = false
	SCENE.unload_ui_scene("level_up")
