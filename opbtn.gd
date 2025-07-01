extends Button

var scene3 : String = "res://options.tscn"


func _on_pressed() -> void:
	$"../../PixelArtResized1920x1080/AnimationPlayer".play("fundido3")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fundido3":
		if scene3 != '':
			get_tree().change_scene_to_file(scene3)
