extends "res://scripts/entities/enemies/MeleeEnemy.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var left_raycast = $RaycastLeft
onready var right_raycast = $RaycastRight

# Called when the node enters the scene tree for the first time.
func _inti():
	health = 5;
	max_health = 5;
	souls = 2;
	speed = 2000;
	jump_speed = -150;
	gravity = 500;
	direction = 0;
	friction = 0.8;
	acceleration = 0.1;
	
	detect_range = 80

func _ready():
	._ready()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	._process(delta)
	$AnimatedSprite.flip_h = false
	if direction > 0:
		$AnimatedSprite.flip_h = true
	
	if is_grounded:
		#print(is_grounded)
		if (right_raycast.is_colliding() and (direction == 1)):
			velocity.y = jump_speed
			is_grounded = false
		elif  (left_raycast.is_colliding() and (direction == -1)):
			velocity.y = jump_speed
			is_grounded = false
	

