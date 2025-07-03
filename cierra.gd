extends CharacterBody2D


@export var speed = 300
const RAY_FLOOR_POSITION = 20
const RAY_WALL_DIRECTION = 20
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	velocity.x = speed
	$ray_floor.position.x = RAY_FLOOR_POSITION
	$ray_wall.target_position.x=RAY_WALL_DIRECTION

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity *  delta
	if not $ray_floor.is_colliding() || $ray_wall.is_colliding():
		velocity.x *= -1
		$ray_floor.position.x *= -1
		$ray_wall.target_position.x *= -1
	
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.call_deferred("die")
