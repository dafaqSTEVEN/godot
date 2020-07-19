extends RigidBody2D
export var speed  = 250
var screen_size



func _process(delta: float) -> void:
<<<<<<< HEAD
	linear_velocity = Vector2(0,0)
=======
	var velocity = Vector2()
	velocity.x += 1
	velocity = velocity.normalized() * speed
	position += velocity * delta 
>>>>>>> parent of e8fdf58... init 0.2






func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
