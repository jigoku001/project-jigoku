extends CharacterBody2D

@export var move_speed : float
@export var jump_speed : float
@onready var animated_sprite = $AnimatedSprite2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_facing_right = true
var player
var checkpoint_manager 
var deaths = 0
signal save 


func _ready() -> void:
	
	checkpoint_manager= get_parent().get_node("game_controller")
	player = get_parent().get_node("player")
	

func _physics_process(delta):
	
	jump(delta)
	move_x()
	flip()
	update_animation()
	move_and_slide()

func move_x():
	var input_axix = Input.get_axis("ui_left","ui_right")
	velocity.x = input_axix * move_speed
	
func flip():
	if (is_facing_right and velocity.x < 0 ) or (not is_facing_right and velocity.x > 0):
			scale.x *= -1
			is_facing_right = not is_facing_right
func jump(delta):
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -jump_speed 
	if not is_on_floor():	
		velocity.y += gravity * delta

func update_animation():
	if not is_on_floor():
		if velocity.y < 0:
			animated_sprite.play("saltar")
		else: 
			animated_sprite.play("caer")
		return
		 
	if velocity.x:
		animated_sprite.play("caminar")
	else:
		animated_sprite.play("respirar")
		
func _process(_delta):
	if position.y > 1200:
		die()
#func _on_Hurtbox_body_entered(body):
	#if body.is_in_group("Peligro"):
	#	body.call_deferred("die")
func die():
	
	Global.global_death += 1
	if deaths < 9:
		player.position = checkpoint_manager.last_location
		deaths += 1
		
	else:
		get_tree().change_scene_to_file("res://game_over.tscn")
		
	$Timer.start()
	

	

func _on_timer_timeout() -> void:
	emit_signal("save")
