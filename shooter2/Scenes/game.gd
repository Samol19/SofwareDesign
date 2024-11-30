extends Node2D

const SLIME = preload("res://Entities/enemy.tscn")
var total_slimes=0
var score = 0

func update_slimes()->void:
	%lbEnemy.text="Enemigos: "+str(total_slimes)

func _ready() -> void:
	spawn_slime()
	spawn_slime()
	spawn_slime()

func spawn_slime():
	var slime =SLIME.instantiate()
	%PathFollow2D.progress_ratio=randf()
	slime.global_position = %PathFollow2D.global_position
	slime.connect("enemy_kill",reduce_slimes)
	total_slimes+=1
	update_slimes()
	add_child(slime)
	
func update_score()->void:
	score+=10
	%lbScore.text = "Score: "+str(score)
	
func reduce_slimes() -> void:
	total_slimes-=1
	update_score()
	update_slimes()

func _on_timer_timeout() -> void:
	spawn_slime()
	spawn_slime()
	spawn_slime()

func _on_player_health_deleted() -> void:
	%GameOver.visible=true
	get_tree().paused=true
