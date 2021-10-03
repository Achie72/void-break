extends "res://scripts/entities/entity.gd"

onready var target_player
var target_player_dist = 9999999
var detect_range = 30
var detect_coldoown = 1 #in secs
var next_detect = 0
var attack_range = 0
var attack_cooldown = 1
var next_attack = 0
var player_in_range
var velocity = Vector2.ZERO


func _init():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	target_player = get_tree().get_nodes_in_group("Players")[0]
	next_detect = (OS.get_ticks_msec()/1000)+detect_coldoown
	next_attack = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (target_player == null) and (OS.get_ticks_msec()/1000 > next_detect):
		find_target()
	else:
		if (OS.get_ticks_msec()/1000 > next_attack):
			attack_target()
			next_attack = OS.get_ticks_msec()/1000 + attack_cooldown
		
	if !is_on_floor():
		velocity.y += gravity * delta
	else:
		is_grounded = true
	move_and_slide(velocity, Vector2.UP)
	
func find_target():
	pass
	
func attack_target():
	pass
