extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimatedSprite2D")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta



func _on_playerdetection_body_entered(body: Node2D) -> void:
	if body.name== "Player":
		print("Chocamos con player")
