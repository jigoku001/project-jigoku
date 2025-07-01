extends Button

@export var level_int: int = 2
@export var level_proyect_dir2: String = "res://nivel_1.tscn"


#func _ready() -> void:
#		pass

func _on_pressed():
	$"../../PixelArtResized1920x1080/AnimationPlayer".play("nivel2")
		


func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "nivel2"):
		if level_proyect_dir2!= '':
			get_tree().change_scene_to_file(level_proyect_dir2)
