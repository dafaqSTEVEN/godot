extends Area2D
var screen_size
var life = 3
export var speed = 400
signal fire
export (PackedScene) var bullet 
signal player_hit

func _ready() -> void:
	screen_size = get_viewport_rect().size
	
func _process(delta: float) -> void:
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta 
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	if Input.is_action_just_pressed("ui_fire"):
		emit_signal("fire")
		


func _on_player_body_entered(body: Node) -> void:
	emit_signal('player_hit')
	body.queue_free()
	hide()
	$CollisionPolygon2D.disabled = true
	yield(get_tree().create_timer(.5), "timeout")
	show()
	$CollisionPolygon2D.disabled = false


func _on_player_fire() -> void:
	if get_tree().get_nodes_in_group("bullet").size() < 3:
		var obj = bullet.instance()
		get_parent().add_child(obj)
		#reposition due to image difference.
		obj.position = position
		obj.linear_velocity = Vector2(0,-700)
		
