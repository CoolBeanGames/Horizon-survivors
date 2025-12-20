##script written by Dustin Booher
#purpose: controls a single level up choice, calling setup assigns all
#the data and allows the player to choose their powerup
##created: 12/20/25
##last edited: 12/20/25
class_name level_up_panel
extends Panel

@export_category("references")
@export var weapon_name : Label
@export var weapon_icon : TextureRect
@export var weapon_description : RichTextLabel
@export var stars_container : HBoxContainer

@export_category("data")
@export var assigned_weapon : weapon
@export var mouse_over : bool

signal clicked(wpn : weapon)

func setup(wpn : weapon):
	assigned_weapon = wpn
	weapon_name.text = wpn.weapon_name
	if wpn.descriptions.size() >= wpn.level:
		weapon_description.text = wpn.descriptions[wpn.level]
	else:
		weapon_description.text = ("weapon level " + str(wpn.level) + " not yet implimented")
	#TODO: add stars here
	#TODO: assign weapon icon here

func _on_select_button_down() -> void:
	clicked.emit(assigned_weapon)
