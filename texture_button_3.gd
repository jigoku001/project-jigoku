extends TextureButton

@export var level_proyect_dir1: String = "res://level_selector.tscn"

func _on_pressed():
	$"../../AnimationPlayer".play("nivel")
		
func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "nivel"):
		if level_proyect_dir1!= '':
			get_tree().change_scene_to_file(level_proyect_dir1)
