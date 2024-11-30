extends Node2D


#Forma 1 referenciar objeto
@onready var player_spawn_pos=$SpawnPosPlayer
@onready var laser_container = $LaserContainer
@onready var timer = $EnemySpawnTimer
@onready var enemy_container= $EnemyContainer
@export var enemy_scenes:Array[PackedScene] = []
@onready var hud = $UILayer/HUD

var player= null
var score :=0:
	set(value):
		score=value
		hud.score=score




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score=0
	#Forma 2 referenciar objeto. Crear grupo ne la clase player
	player=get_tree().get_first_node_in_group("player")
	player.global_position = player_spawn_pos.global_position	
	player.laser_shoot.connect(_on_player_laser_shoot)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _on_player_laser_shoot(laser_scene,location)->void:
	var laser=laser_scene.instantiate()
	laser.global_position=location
	laser_container.add_child(laser)


func _on_enemy_spawn_timer_timeout() -> void:
	var e = enemy_scenes.pick_random().instantiate()
	e.global_position = Vector2(randf_range(50,500),50)
	e.killed.connect(_on_enemy_killed)
	enemy_container.add_child(e) 

func _on_enemy_killed(points) ->void:
	score+=points
