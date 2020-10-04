extends Node

onready var health = $"/root/World/Player/Camera2D/UI/Health/Player_Health"
onready var souls = $"/root/World/Player/Camera2D/UI//Souls/Player_Souls"
onready var player = $"/root/World/Player"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
 health.text = ":" + str(player.health)
 souls.text = ":" + str(player.souls)
