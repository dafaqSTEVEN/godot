extends Node2D

export (PackedScene) var bullet
export (PackedScene) var enemy
export (PackedScene) var enemy_bullet
export (PackedScene) var block

var screen_size
var enemy_in_column = 8
var enemy_row = 3
var mob_shoot_timer = [1,3]
var mob_distance = [20]
var dir 
var mob_speed = Vector2(30,40)
var mob_time = [0.01,0.8]
var mob_totals = 0
var old_vel = Vector2(0,0)
var dis =  Vector2()
var block_row = [8,10,10,10,2]
var try = false

func _ready() -> void:
	restart()
	
	
	
	
	
func restart():
	try = false
	get_tree().call_group("mob", "queue_free")
	$UI/end.visible = false
	$UI/gameover.visible = false
	$UI.score = 0
	$UI.life = 3
	$UI/life_value.text = str(3)
	$UI/score_value.text = str(0)
	mob_totals = 0
	randomize()
	screen_size = get_viewport_rect().size
	var init_posit = $enemy_init.position
	for y in range(enemy_row):
		for i in range(enemy_in_column):
			var target = enemy.instance()
			add_child(target)
			target.connect("hit_enemy",self,"on_hit")
			target.position = init_posit
			init_posit.x += 100
			mob_totals += 1
		init_posit.y += 50
		init_posit.x = $enemy_init.position.x
	
	var block_init = $block_init
	var init_def = Vector2(0,0) 
	var y_add = Vector2(0,0)
	for z in range(3):
		for g in range(len(block_row)):
			if block_row[g] == 10:
				for x in range(10):
					var blocking = block.instance()
					add_child(blocking)
					blocking.position = block_init.position + init_def + y_add
					init_def.x += 30
				init_def = Vector2(0,0)
				y_add.y += 30
			if block_row[g] == 8:
				init_def.x += 30
				for x in range(8):
					var blocking = block.instance()
					add_child(blocking)
					blocking.position = block_init.position + init_def + y_add
					init_def.x += 30
				y_add.y += 30
				init_def = Vector2(0,0)
			if block_row[g] == 2:
				init_def.x = 30
				var blocking = block.instance()
				add_child(blocking)
				blocking.position = block_init.position + y_add
				var blocking_2 = block.instance()
				add_child(blocking_2)
				blocking_2.position = block_init.position + (init_def * 9) + y_add
				init_def = Vector2(0,0)
				y_add.y = 0
		block_init.position.x += 400
	
	
	
	
	
	old_vel = Vector2(0,0)
	dir = 'left'
	$mob_move_timer.start(1)
	$ran_timer_enemy.start(1)
	


func on_hit():
	$UI.add_score()



func _on_ran_timer_enemy_timeout() -> void:
	var enemy_group = get_tree().get_nodes_in_group("mob")
	if len(enemy_group) > 0:
		var target = enemy_group[int(rand_range(0, len(enemy_group)))]
		target.enemy_fire(target)
		$ran_timer_enemy.start(rand_range(mob_shoot_timer[0], mob_shoot_timer[1]))


func _on_mob_move_timer_timeout() -> void:
	var temp_t
	var item = get_tree().get_nodes_in_group("mob")
	if len(item) > 0:
		var rect = Rect2(item[0].position,Vector2.ZERO)
		var margin = 100
		for thing in item:
			rect = rect.expand(thing.position)
		var min_pos = rect.position
		var max_pos = rect.end
		if dir == 'left':
			dis.x = -(mob_speed.x)
		if dir == 'right':
			dis.x = mob_speed.x
		if old_vel.y != 0:
			dis.y = 0
		elif (min_pos.x - mob_speed.x) <  margin or \
			(max_pos.x + mob_speed.x) > (screen_size.x - margin):
			dis.y = mob_speed.y
			dis.x = 0
			if dir == 'left':
				dir = 'right'
			else:
				dir = 'left'
		
		old_vel = dis
		get_tree().call_group("mob", "move", dis)	
		temp_t = lerp(mob_time[0],mob_time[1],(len(item)/float(mob_totals)))
		$mob_move_timer.start(temp_t)
	
	
				
func _process(delta: float) -> void:
	if len(get_tree().get_nodes_in_group("mob")) == 0:
		win()
	if try == true and Input.is_action_just_released("ui_accept"):
		restart()

func _on_player_player_hit() -> void:
	if $UI.player_life() == 0:
		gameover()
	
func gameover():
	$UI/gameover.visible = true
	$ran_timer_enemy.stop()
	$mob_move_timer.stop()
	try = true
	
func win():
	$UI/end.visible = true
	try = true
	
