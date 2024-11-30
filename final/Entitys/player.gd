extends CharacterBody2D
const SPEED = 650.0
var health= 3.0
@onready var gameScene = get_tree().current_scene

func _physics_process(delta: float) -> void:
	var direction_x := Input.get_axis("left", "right")
	var direction_y := Input.get_axis("up", "down")
	velocity.x = direction_x * SPEED
	velocity.y = direction_y * SPEED
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):  
		health -= 1  
		print("Vidas restada: ", health)
		body.queue_free()
		update_lives_label()
	if body.is_in_group("not_enemy"):  
		if health<5:
			health+=1
			print("Vida sumada: ", health)
		body.queue_free()
		update_lives_label()
	if health<=0:
		gameOver()
		
		
func update_lives_label() -> void:
	%lbLives.text = "Vidas :"+ " "+str(health)

func gameOver() ->void:
	#Borrar jugador
	queue_free()
	#Borrar entidades
	for child in gameScene.get_children():
		if child.is_in_group("enemy") || child.is_in_group("not_enemy"):
			child.queue_free()  # Eliminar el jugador o los enemigos)
	#Parar el timer
	%EnemyTimer.stop()
	#Mostrar game over
	%lbGameOver.visible = true
