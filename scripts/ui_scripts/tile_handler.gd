extends TileMap


onready var player = $"/root/World/Player"
onready var tile_map = $"/root/World/TileMap"
onready var info_label = $"/root/World/Player/Info"

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta):
	var id = tile_map.get_cellv(tile_map.world_to_map(player.position))
	if ((id == 12) or (id == 14)):
		#info_label. = Vector2(player.position.x,player.position.y-8)
		info_label.text = str("cost")
		if Input.is_action_pressed("ui_down"):
			tile_map.set_cellv(tile_map.world_to_map(player.position), id+1)
	else:
		info_label.text = ""
	if id == 16:
		player.health += 1
	if id == 10:
		player.souls += 1
