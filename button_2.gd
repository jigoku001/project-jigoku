extends Button

@export var level_proyect_dir1: String = "res://nivel_1.tscn"

var status = Global.progress

func _ready() -> void:
	
	if status >= 2  :
		$".".disabled = false 

func _on_pressed():
	$"../../PixelArtResized1920x1080/AnimationPlayer".play("nivel2")
		


func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "nivel2"):
		if level_proyect_dir1!= '':
			get_tree().change_scene_to_file(level_proyect_dir1)
