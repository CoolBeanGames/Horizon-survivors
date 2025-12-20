##script written by Dustin Booher
#purpose: general player manager
##created: 12/14/25
##last edited: 12/20/25
class_name player
extends CharacterBody2D

@export_category("movement stats")
@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var facing_direction : int
@export var is_in_air : bool = false

@export_category("enemy stats")
@export var closest_enemy : enemy
@export var direction_to_enemy : Vector2

@export_category("references")
@export var land_on_ground_sound : AudioStream
@export var game : game_manager
@export var weapons : Dictionary[String,weapon] = {}

@export_category("stats")
@export var hp : Vector2 = Vector2(10,10)
@export var xp : Vector2 = Vector2(0,10)
@export var level : int = 1

func _ready() -> void:
	REFS.write("player",self)
	game = REFS.read("game")
	await get_tree().process_frame

func _process(_delta: float) -> void:
	if is_on_floor():
		if is_in_air:
			is_in_air = false
			AUDIO.play_audio(land_on_ground_sound,0.5)
	else:
		is_in_air = true
	closest_enemy = find_nearest_enemy()
	direction_to_enemy = get_direction_to_enemy(closest_enemy)
	for w in weapons.values():
		w.count_down(_delta,self,closest_enemy,direction_to_enemy)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		facing_direction =  sign(direction)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func find_nearest_enemy() -> enemy:
	var enemies = DATA.read("enemies",[])
	if enemies.size() > 0:
		var distance := INF
		var current_enemy : enemy = null
		for e in enemies:
			var d = (e.global_position - global_position).length()
			if d < distance:
				distance = d
				current_enemy = e
		return current_enemy
	return null

func get_direction_to_enemy(e : enemy) -> Vector2:
	if e == null:
		return Vector2(0,0)
	return (e.global_position - global_position).normalized()

func jump():
	velocity.y = JUMP_VELOCITY

##processing for leveling the player up
func level_up():
	game.show_level_up_menu(game.get_levelup_list())
	level += 1
	xp.x -= xp.y
	xp.y *= 1.7 + ((level * exp(3)/25))
	print("player gained a level, next level xp: " , xp.y)

#called whenever the player gains XP
func gain_xp(xp_to_gain : int):
	var mult : float = 1
	if weapons.has("tomb of knowledge"):
		mult = weapons["tomb of knowledge"].xp_mult
	xp.x += xp_to_gain * mult
	if xp.x >= xp.y:
		level_up()
