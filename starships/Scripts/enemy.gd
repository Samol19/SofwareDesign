class_name Enemy extends Area2D
signal killed(points)

@export var speed =300
@export var life =1
@export var points=100

func _physics_process(delta: float) -> void:
	global_position.y +=speed * delta

func die()->void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.die()
		die()


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	die()

func take_damage(amount)->void:
	life -=amount
	if life <=0:
		killed.emit(points)
		die()
