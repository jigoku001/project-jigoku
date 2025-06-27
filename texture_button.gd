extends TextureButton

@export var level_int: int =1
@export var level_proyect_dir: String = "res://nivel_1.tscn"


#func _ready() -> void:
#		pass

func _on_pressed():
	$"../../AnimationPlayer".play("inicio")
		


func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "inicio"):
		
		if level_proyect_dir!= '':
			get_tree().change_scene_to_file(level_proyect_dir)
