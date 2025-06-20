extends Button

@export var level_int: int =2
@export var level_proyect_dir: String = "res://level_2.tscn"


#func _ready() -> void:
#		pass

func _on_pressed():
	$"../../PixelArtResized1920x1080/AnimationPlayer".play("inicio")
		


func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "inicio"):
		
		if level_proyect_dir!= '':
			get_tree().change_scene_to_file(level_proyect_dir)
