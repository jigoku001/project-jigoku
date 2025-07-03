extends Button

var nivel : String = Global.current_level 


func _on_pressed():
	get_tree().change_scene_to_file(nivel)
