extends Area2D

@export var nivel :String = ""
@export var progres := 2


func _on_body_entered(body):
	Global.progress = progres
	if body.is_in_group("Player"):
		body.call_deferred("saved")
		$Timer.start(0.18)

		
	
func next():
	
	var ruta = get_tree().change_scene_to_file(nivel)
	call_deferred("ruta")
		


func _on_timer_timeout() -> void:
	next()
