extends Sprite

onready var player_sprite = $"/root/World/Player/PlayerAnimation"
onready var player = $"/root/World/Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	visible = true
	flip_h = player_sprite.flip_h
	if flip_h:
		offset.x = -8
	else:
		offset.x = 8
	
	if not player.is_attacking:
		visible = false

