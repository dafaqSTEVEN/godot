extends Node2D

export (PackedScene) var bullet
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size



func _on_player_fire() -> void:
	var obj = bullet.instance()
	add_child(obj)
	
	
