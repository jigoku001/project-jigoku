extends Button

var scene2 : String = "res://level_selector.tscn"



func _on_pressed() -> void:
	$"../../PixelArtResized1920x1080/AnimationPlayer".play("fundido2")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fundido2":
		if scene2 != '':
			get_tree().change_scene_to_file(scene2)
