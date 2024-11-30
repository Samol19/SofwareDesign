class_name Player extends RigidBody2D

@export var FLAP_FORCE = -620
@onready var animator = $AnimationPlayer

const MAX_ROTATION_DEGREES = -30.0
var started = false

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("flap"):
		if !started:
			start()
		flap()
		if rotation_degrees <= MAX_ROTATION_DEGREES:
			angular_velocity =0
			rotation_degrees= MAX_ROTATION_DEGREES
		if linear_velocity.y >0:
			if rotation_degrees<=90:
				angular_velocity =5
			else:
				angular_velocity=0

func start():
	if started:return
	started=true
	gravity_scale = 1.3
	animator.play("flap")

func flap():
	linear_velocity.y =FLAP_FORCE
	angular_velocity = -8.0
