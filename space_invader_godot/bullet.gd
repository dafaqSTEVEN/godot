extends RigidBody2D
export var speed  = 250
var screen_size



func _process(delta: float) -> void:
	linear_velocity = Vector2(0,0)






func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
