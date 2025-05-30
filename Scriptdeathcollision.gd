extends Area2D

@export var group_to_kill := "player"

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group(group_to_kill):
		body.die()
