extends Node2D

export (bool) var ForceEnable
var is_pressed

func _process(delta):
	if ForceEnable:
		if is_pressed:
			Input.action_press("ui_up")
		else:
			Input.action_release("ui_up")

func _on_TouchScreenButton_pressed():
	is_pressed = true


func _on_TouchScreenButton_released():
	is_pressed = false
