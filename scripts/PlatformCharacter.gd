extends ""

export (int) var speed = 120
export (int) var jump_speed = -200
export (int) var gravity = 400
export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.1
var released_jump = false

var velocity = Vector2.ZERO

func get_input():
	var dir = 0
	if Input.is_action_pressed("ui_right"):
		dir += 1
		$PlayerAnimation.flip_h = false
	if Input.is_action_pressed("ui_left"):
		dir -= 1
		$PlayerAnimation.flip_h = true
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
		$PlayerAnimation.play("run")
	else:
		velocity.x = lerp(velocity.x, 0, friction)
		$PlayerAnimation.play("idle")
	if Input.is_action_just_released("ui_up"):
		if not released_jump:
			jump_cut()
			released_jump = true
		
	
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_pressed("ui_up"):
		if is_on_floor():
			jump()
	if not is_on_floor():
		$PlayerAnimation.play("jump")
		
	
func jump():
	velocity.y = jump_speed
	released_jump = false
	
func jump_cut():
	if velocity.y < gravity:
		velocity.y = velocity.y/2

