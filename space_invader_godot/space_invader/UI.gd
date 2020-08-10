extends CanvasLayer


var score = 0
var life = 3

func add_score():
	score += 100
	$score_value.text = str(score)

func player_life():
	life -= 1
	score -= 300
	$score_value.text = str(score)
	$life_value.text = str(life)
	return(int(life))
