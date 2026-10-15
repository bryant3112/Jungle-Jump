extends CharacterBody2D

const SPEED = 60.0
var direction = -1

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	velocity.x = direction * SPEED
	
	move_and_slide()
	
	if is_on_wall():
		direction *= -1
		$RayCast2D.target_position.x *= -1
		
	if is_on_floor() and not $RayCast2D.is_colliding():
		direction *= -1
		$RayCast2D.target_position.x *= -1
			
	$AnimatedSprite2D.flip_h = direction > 0
			
