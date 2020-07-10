extends RigidBody2D
export var speed  = 250
var screen_size

func _ready() -> void:
	screen_size = get_tree().get_viewport_rect().size

func _process(delta: float) -> void:
	var velocity = Vector2()
	velocity.x += 1
	velocity = velocity.normalized() * speed
	position += velocity * delta 

	

