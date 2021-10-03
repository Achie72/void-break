extends Node2D

var speed = 100
var velocity = Vector2()
var direction = 1
var damage = 0;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity.x = speed * delta * direction
	if direction < 1:
		$AnimatedSprite.flip_v = true
	translate(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	#queue_free()
	pass





func _on_fireball_area_body_entered(body):
	if not body.is_in_group("Players"):
		if body.is_in_group("Enemies"):
			body.damage(damage)
	queue_free()
