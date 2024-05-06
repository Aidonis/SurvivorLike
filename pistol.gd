extends Area2D
#Fires 3 bullets

@export var weapon:Weapon

func _ready():
	
	var timer:Timer = %Timer
	timer.wait_time *= weapon.rate_of_fire

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)

func shoot():
	const BULLET = preload("res://bullet.tscn")
	
	for i in range(weapon.bullets):
		var new_bullet = BULLET.instantiate()
		new_bullet.global_position = %ShootingPoint.global_position
		
		if i % 2:
			new_bullet.global_rotation = %ShootingPoint.global_rotation + (i / 10.0)
		else:
			new_bullet.global_rotation = %ShootingPoint.global_rotation - (i / 10.0)
		%ShootingPoint.add_child(new_bullet)

func _on_timer_timeout():
	shoot()
