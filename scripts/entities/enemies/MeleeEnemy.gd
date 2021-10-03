extends "res://scripts/entities/entity.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var target_player = null
var target_player_dist = 9999999
var detect_range = 30
var detect_coldoown = 3 #in secs
var next_detect = 0
var attack_range = 0
var velocity = Vector2.ZERO


func _init():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	next_detect = (OS.get_ticks_msec()/1000)+detect_coldoown
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target_player == null:
		find_target()
	else:
		attack_target()
		
	if !is_on_floor():
		velocity.y += gravity * delta
	else:
		#velocity.y = 0
		is_grounded = true
	move_and_slide(velocity, Vector2.UP)

func find_target():
	
		var max_dist = 9999999
		var active_players = get_tree().get_nodes_in_group("Players")
		for player in active_players:
			var dist = abs(player.get_position().x - get_position().x)
			if (dist < detect_range) and (next_detect < (OS.get_ticks_msec()/1000)):
				if dist < max_dist:
					max_dist = dist
					target_player_dist = dist
					target_player = player
					next_detect = (OS.get_ticks_msec()/1000) + detect_coldoown
					
					direction = -1 #left
					if player.get_position().x > get_position().x:
						direction = 1
					
func attack_target():
	direction = -1 #left
	if target_player.get_position().x > get_position().x:
		direction = 1
	if target_player_dist < detect_range:
		velocity.x = lerp(velocity.x, direction * speed/2 * friction, acceleration)
		
