extends Node2D

export (PackedScene) var bullet
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size



func _on_player_fire() -> void:
	var obj = bullet.instance()
	add_child(obj)
<<<<<<< HEAD
=======
	#reposition due to image difference.
	obj.position = Vector2($player.position.x -10,$player.position.y - 15 )
	obj.linear_velocity = Vector2(0,-1000)
>>>>>>> parent of 0db683e... err commit to revert
	
	
