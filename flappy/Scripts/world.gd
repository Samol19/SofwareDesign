extends Node2D


@onready var hud = $HUD
@onready var obstacle_spawner= $ObstacleSpawner

var score := 0: set =set_score, get= get_score

func _ready() -> void:
	obstacle_spawner.connect("obstacle_create", _on_obstacle_created)
	
func _on_obstacle_created(obstacle):
	obstacle.connect("score",player_score)

func get_score():
	return score

func set_score(new_score):
	score= new_score
	hud.update_score(score)
	
func player_score():
	score+=1
