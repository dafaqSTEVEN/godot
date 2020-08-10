extends Area2D









func _on_block_body_entered(body: Node) -> void:
	body.queue_free()
	queue_free()
