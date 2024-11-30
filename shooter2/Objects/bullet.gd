extends Area2D

var travelled =0
const SPEED = 1000
const RANGE = 1200
func _physics_process(delta: float) -> void:
		var direction = Vector2.RIGHT.rotated((rotation))
		position +=direction * SPEED * delta
		travelled += SPEED * delta
		if travelled>RANGE:
			queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
