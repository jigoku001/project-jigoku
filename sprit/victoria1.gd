class_name Victoria
extends CharacterBody2D

@export var gravity = 100


func _physics_process(delta):
	
 if not is_on_floor():
	 velocity.y = velocity.y + gravity * delta
		
 move_and_slide()
		
