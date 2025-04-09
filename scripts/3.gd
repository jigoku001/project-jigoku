extends Area2D

signal victory

@export var player_group: String = "player"

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):  # Cambié el nombre para que coincida con el `connect`
	if body.is_in_group(player_group):
		print("Has Ganado")
		victory.emit()
		queue_free()
