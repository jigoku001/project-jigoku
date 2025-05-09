extends CharacterBody2D

const Goblo = 90
func _ready(): 
	velocity.x = -Goblo
	velocity.y = -Goblo
	$AnimatedSprite2D.play("run")

func _physics_process(delta):
	
	if is_on_ceiling():
		if !$AnimatedSprite2D.flip_h:
			velocity.y = Goblo
		else:
			velocity.y = -Goblo
			
	if velocity.y < 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.y > 0:
		$AnimatedSprite2D.flip_h = true
		
	if is_on_floor():
		if !$AnimatedSprite2D.flip_h:
			velocity.y = Goblo
		else:
			velocity.y = -Goblo
			
	if velocity.y < 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.y > 0:
		$AnimatedSprite2D.flip_h = true
		
	if is_on_wall():
		if !$AnimatedSprite2D. flip_h:
			velocity.x = Goblo
		else:
			velocity.x = -Goblo
			
	
	move_and_slide()
