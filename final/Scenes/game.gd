extends Node2D
@export var enemy_1: PackedScene
@onready var lbLives = $HUD/lbLives
@onready var player = $player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$EnemyTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_enemy_timer_timeout() -> void:
	spawn_enemy()
	
func spawn_enemy() -> void:
	var enemy = enemy_1.instantiate()  # Instanciar la escena del enemigo
	add_child(enemy)
	var screen_size = get_viewport_rect().size

	var side = randi() % 4  
	var position: Vector2
	var direction: Vector2
	
	match side:
		0:  # Arriba
			position = Vector2(randi() % int(screen_size.x), -20)
			direction = Vector2.DOWN
		1:  # Abajo
			position = Vector2(randi() % int(screen_size.x), screen_size.y + 20)
			direction = Vector2.UP
		2:  # Izquierda
			position = Vector2(-20, randi() % int(screen_size.y))
			direction = Vector2.RIGHT
		3:  # Derecha
			position = Vector2(screen_size.x + 20, randi() % int(screen_size.y))
			direction = Vector2.LEFT
	
	enemy.position = position
	enemy.direction = direction.normalized()
