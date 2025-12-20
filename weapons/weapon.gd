##script written by Dustin Booher
#purpose: base class for weapons, used to attack
##created: 12/14/25
##last edited: 12/20/25
@abstract
class_name weapon
extends Resource

@export var damage : int = 1
@export var cool_down : float = 2
@export var cool_down_timer : float = 0
@export var level : int = 1
@export var max_level : int = 5
@export var weapon_name : String = "weapon_default"
@export var descriptions : Array[String] = []
@export var effect : PackedScene
@export var is_active : bool = true
@export var does_fire : bool = true
@export var audio : AudioStream = null

func count_down(delta : float, plr : player , enm : enemy, dir : Vector2):
	if does_fire:
		if is_active:
			cool_down_timer += delta
			if cool_down_timer >= cool_down:
				cool_down_timer-=cool_down
				fire(plr,enm,dir)

@abstract func fire(plr : player , enm : enemy, dir : Vector2)

func play_audio():
	if audio != null:
		AUDIO.play_audio(audio,0.5)

##called to level up a weapon, returns if the weapon is now at max level or not
func level_up() -> bool:
	level += 1
	increase_stats(level)
	return level >= max_level

@abstract func increase_stats(new_lvl : int)
