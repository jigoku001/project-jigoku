extends Area2D

@export var nivel :String = ""
var ruta := get_tree().change_scene_to_file(nivel)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		call_deferred("ruta")
