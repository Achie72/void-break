extends TouchScreenButton

export (bool) var ForceEnable
signal attack_signal
var is_pressed

func _process(delta):
	if ForceEnable:
		if is_pressed:
			emit_signal("attack_signal")


func _on_TouchScreenButton_pressed():
	is_pressed = true


func _on_TouchScreenButton_released():
	is_pressed = false
