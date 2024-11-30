extends CharacterBody2D


@export var speed: float = 400.0
var direction: Vector2 = Vector2.ZERO
@export var skins: Array[Texture2D]

func _ready() -> void:
	# Seleccionar una skin aleatoria
	if skins.size() > 0:
		var sizeskin= randi() % skins.size()
		if sizeskin==0:
			add_to_group("not_enemy")
		else:
			add_to_group("enemy")
		var random_skin = skins[sizeskin]
		$Sprite2D.texture = random_skin

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
