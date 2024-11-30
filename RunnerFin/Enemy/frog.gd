extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false
var death = false
var SPEED =50
@onready  var anim = get_node("AnimatedSprite2D")

func _physics_process(delta: float) -> void:
	
	velocity += get_gravity() * delta
	if chase:
		if anim.animation != 'Death':
			anim.play("Jump")
			player = get_node("../PlayerContainer/Player")
			var direction = (player.position - self.position).normalized()
			if direction.x > 0:
				get_node("AnimatedSprite2D").flip_h = true
				#print("lo correteo hacia la derecha")
			else:
				get_node("AnimatedSprite2D").flip_h = false
				#print("lo correteo hacia la izquierda")
			velocity.x = direction.x * SPEED
	else:
		if death != true:
			anim.play("Iddle")
			velocity. x = 0
	move_and_slide()

func _on_player_detection_body_entered(body: Node2D) -> void:
	if body.name == "Player" :
		chase = true

func _on_player_detection_body_exited(body: Node2D) -> void:
	if body.name == "Player" :
		chase = false

func _on_player_death_body_entered(body: Node2D) -> void:
	if body.name == "Player" :
		chase = false
		death = true
		velocity.x = 0
		anim.play("Death")
		await anim.animation_finished
		self.queue_free()
