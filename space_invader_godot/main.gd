extends Node2D

export (PackedScene) var bullet
export (PackedScene) var enemy
export (PackedScene) var enemy_bullet

var screen_size
var list = [250,350,450,550,650,750,850,950]

func _ready() -> void:
	randomize()
	screen_size = get_viewport_rect().size
	for i in range(list.size()):
		var target = enemy.instance()
		add_child(target)
		target.position = Vector2(list[i],100)
	for i in range(list.size()):
		var target = enemy.instance()
		add_child(target)
		target.position = Vector2(list[i],150)



func _on_player_fire() -> void:
	if get_tree().get_nodes_in_group("bullet").size() < 3:
		var obj = bullet.instance()
		add_child(obj)
		#reposition due to image difference.
		obj.position = $player.position
		obj.linear_velocity = Vector2(0,-700)
	
func enemy_fire():
		for i in range(list.size()):
			if randi() % 10 == 0:
				var jet_bullet = enemy_bullet.instance()
				jet_bullet.position = Vector2(list[i],180)
				add_child(jet_bullet)
				jet_bullet.linear_velocity = Vector2(0,450)
				break
		
	
	
	




