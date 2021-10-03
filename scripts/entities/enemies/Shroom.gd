extends "res://scripts/entities/enemies/RangedEnemy.gd"

onready var line_of_sight_ray = $LineOfSight
const INDICATOR = preload("res://scenes/Indicator.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	attack_range = 60
	detect_range = 60
	max_health = 10

func _process(delta):
	._process(delta)
	
	var in_vision = find_target()

func find_target():
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(self.global_position, target_player.global_position, [self])
	if not result.collider == target_player:
		return false
	else:
		return true

func attack_target():
	var dist = abs(target_player.get_position().x - get_position().x)
	print(dist)
	if (dist < detect_range) and (next_detect < (OS.get_ticks_msec()/1000)):
		if dist < attack_range:
			player_in_range = true
			direction = -1 #left
			if target_player.get_position().x > get_position().x:
				direction = 1
		else:
			player_in_range = false
	else:
		player_in_range = false
		
	if player_in_range:
		print("lol")
		var indication = INDICATOR.instance()
		indication.position = target_player.position
		get_parent().add_child(indication)
