extends CharacterBody2D

var health =10
var player;

signal enemy_kill
var SMOKE = preload("res://assets/smoke_explosion/smoke_explosion.tscn")

func _ready() -> void:
	player = get_node("/root/Game/Player")
	get_node("Slime").play_walk()

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 50
	move_and_slide()

		
func take_damage()->void:
	health= health - 1
	%Slime.play_hurt()
	if health <=0:
		enemy_kill.emit()
		queue_free()
		var smoke = SMOKE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
