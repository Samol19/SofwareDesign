extends Node2D

signal obstacle_create(obs)

@onready var timer = $Timer
var Obstacle = preload("res://Enviroment/obstacle.tscn")

func _ready() -> void:
	randomize()
	start()

func _on_timer_timeout() -> void:
	spawn_obstacle()


func spawn_obstacle():
	var obstacle = Obstacle.instantiate()
	add_child(obstacle)
	obstacle.position.y = randi()%400 - 150
	emit_signal("obstacle_create",obstacle)
	
func start():
	timer.start()

func stop():
	timer.stop()
