extends RigidBody2D


func _process(delta: float) -> void:
	pass
	


	





func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
