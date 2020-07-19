extends Area2D
signal hit_enemy





func _on_enemy_body_entered(body: Node) -> void:
	hide()
	emit_signal("hit_enemy")
	$CollisionPolygon2D.set_deferred("disabled",true)

