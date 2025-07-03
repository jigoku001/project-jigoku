extends Button


@export var level_proyect_dir3: String = "res://nivel3.tscn"
var status = Global.progress

func _ready() -> void:
	
	if status == 3 :
		$".".disabled = false

func _on_pressed():
	$"../../PixelArtResized1920x1080/AnimationPlayer".play("nivel3")
		


func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "nivel3"):
		
		if level_proyect_dir3!= '':
			get_tree().change_scene_to_file(level_proyect_dir3)
