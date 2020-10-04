extends KinematicBody2D


export (int) var health;
export (int) var max_health;
export (int) var souls;
export (int) var speed;
export (int) var jump_speed;
export (int) var gravity;
export (float, 0, 1.0) var friction;
export (float, 0, 1.0) var acceleration;
export (int) var ai_type;



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
