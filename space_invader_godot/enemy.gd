extends Area2D
signal hit_enemy
export (PackedScene) var enemy_bullet



func enemy_fire(target):
	var jet_bullet = enemy_bullet.instance()
	jet_bullet.position = Vector2(target.position.x + 30,target.position.y +10)
	get_parent().add_child(jet_bullet)
	jet_bullet.linear_velocity = Vector2(0,450)
		



func _on_enemy_body_entered(body: Node) -> void:
	body.queue_free()
	emit_signal("hit_enemy")
	$CollisionPolygon2D.set_deferred("disabled",true)
	queue_free()

func move(dis):
	position += dis
