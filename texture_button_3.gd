extends TextureButton

@export var level_proyect_dir1: String = "res://level_selector.tscn"

func _on_pressed():
<<<<<<< HEAD
	$"../../AnimationPlayer".play("nivel")
		
func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "nivel"):
=======
	$"../../PixelArtResized1920x1080/AnimationPlayer".play("menu")
		
func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "menu"):
>>>>>>> e5bcff6818734a6923276f75036d1aa6281949b6
		if level_proyect_dir1!= '':
			get_tree().change_scene_to_file(level_proyect_dir1)
