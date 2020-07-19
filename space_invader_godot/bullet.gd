extends RigidBody2D





func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_bullet_body_entered(body: Node) -> void:
	hide()
#	$CollisionShape2D.set_deferred("disabled",true)





