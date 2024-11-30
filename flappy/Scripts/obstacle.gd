extends Node2D

signal score

const SPEED = -260

func _physics_process(delta: float) -> void:
	position.x += SPEED*delta
	if global_position.x <= -100:
		queue_free()



func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Player:
		if body.has_method("die"):
			body.die()


func _on_pipe_2_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		body.die()

func _on_score_entrance_body_exited(body: Node2D) -> void:
	if body is Player:
		emit_signal("score")
