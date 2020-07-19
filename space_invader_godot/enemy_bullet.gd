extends RigidBody2D









func _on_RigidBody2D_body_entered(body: Node) -> void:
	queue_free()
