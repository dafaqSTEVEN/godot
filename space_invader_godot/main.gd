extends Node2D

export (PackedScene) var bullet
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size



func _on_player_fire() -> void:
	if get_child_count() < 4:
		var obj = bullet.instance()
		add_child(obj)
		#reposition due to image difference.
		obj.position = $player.position
		obj.linear_velocity = Vector2(0,-700)
	

	
