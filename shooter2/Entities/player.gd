extends CharacterBody2D
signal health_deleted

var health= 100.0
const DAMAGE_RATE = 5.0

func _ready() -> void:
	updateLive()
func updateLive()->void:
	%lbLive.text = "Vida: " +str(health).pad_decimals(2)
	
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 600
	move_and_slide()

		
	var slimes = %HurtBox.get_overlapping_bodies()
	if slimes.size()>0:
		%HealthBar.value=health
		updateLive()
		health -= DAMAGE_RATE * slimes.size()*delta
		if health<= 0.0:
			health_deleted.emit()
			
