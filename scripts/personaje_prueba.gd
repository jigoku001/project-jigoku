class_name Player
extends CharacterBody2D

@export var gravity = 980
@export var jump_speed = 300
@export var speed = 300
@onready var sprite:Sprite2D


func _physics_process(delta):
	
	#horizontal
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = speed * direction
	
	if direction != 0:
		$AnimatedSprite2D.scale.x = direction
	
	#gravedad
	if not is_on_floor():
		velocity.y = velocity.y + gravity * delta
	
	#saltar
	var jump_pressed = Input.is_action_just_pressed("ui_up")
	if jump_pressed:
		velocity.y = velocity.y - jump_speed
	
	move_and_slide()
