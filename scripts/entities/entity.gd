extends KinematicBody2D


export (int) var health;
export (int) var max_health;
export (int) var souls;
export (int) var speed;
export (int) var jump_speed;
export (int) var gravity;
export (int) var direction;
export (float, 0, 1.0) var friction;
export (float, 0, 1.0) var acceleration;
export (int) var ai_type;
export (bool) var is_grounded = false


func damage(dmg):
	health -= dmg
	if health <= 0:
		var active_players = get_tree().get_nodes_in_group("Players")
		for player in active_players:
			player.souls += souls
		queue_free()
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
