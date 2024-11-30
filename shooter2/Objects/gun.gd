extends Area2D

const BULLET = preload ("res://Objects/bullet.tscn")

func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0 :
		var target = enemies_in_range.front()
		look_at(target.global_position)

func shoot():
	var new_b = BULLET.instantiate()
	new_b.global_position= %Shoot.global_position
	new_b.global_rotation= %Shoot.global_rotation
	%Shoot.add_child(new_b)
	

func _on_timer_timeout() -> void:
	shoot()
