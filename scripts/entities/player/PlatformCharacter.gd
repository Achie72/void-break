extends "../entity.gd"

var released_jump = false
var velocity = Vector2.ZERO
var is_attacking = false

func _init():
	max_health = 10;
	health = max_health;
	souls = 0;
	speed = 120
	jump_speed = -200

	friction = 0.1
	acceleration = 0.1

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
	is_attacking = Input.is_action_pressed("attack_player_1")
	
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

