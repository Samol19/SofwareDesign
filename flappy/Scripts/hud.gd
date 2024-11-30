extends CanvasLayer

@onready var score_label = $score

# Called when the node enters the scene tree for the first time.
func update_score(new_score):
	score_label.text=str(new_score)
