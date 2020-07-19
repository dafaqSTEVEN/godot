extends RigidBody2D
export var speed  = 250
var screen_size

func _ready() -> void:
	screen_size = get_tree().get_viewport_rect().size

func _process(delta: float) -> void:
	linear_velocity = Vector2(0,0)
	
	

	

