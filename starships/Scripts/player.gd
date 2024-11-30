class_name Player extends CharacterBody2D

@export var speed= 43000
@onready var laserspawn = $LaserSpawn

signal laser_shoot(laser_scene,location)
var laser_scene = preload("res://Entitys/laser.tscn")

var shoot_cd = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		if !shoot_cd:
			shoot()
			shoot_cd=true
			await get_tree().create_timer((0.20)).timeout
			shoot_cd=false

func _physics_process(delta: float) -> void:
	var direction = Vector2(Input.get_axis("move_left","move_right"),
					Input.get_axis("move_up","move_down"))
	velocity= direction * delta*speed
	move_and_slide();
	global_position = global_position.clamp(Vector2.ZERO,get_viewport_rect().size)


func shoot()->void:
	laser_shoot.emit(laser_scene,laserspawn.global_position)

func die()->void:
	queue_free()
