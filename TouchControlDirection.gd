extends Node2D

export (bool) var ForceEnable 
var left_is_pressed
var right_is_pressed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ForceEnable:
		if left_is_pressed:
			Input.action_press("ui_left")
		else:
			Input.action_release("ui_left")
		if right_is_pressed:
			Input.action_press("ui_right")
		else:
			Input.action_release("ui_right")		
	


func _on_Left_pressed():
	left_is_pressed = true


func _on_Left_released():
	left_is_pressed = false


func _on_Right_pressed():
	right_is_pressed = true


func _on_Right_released():
	right_is_pressed = false
