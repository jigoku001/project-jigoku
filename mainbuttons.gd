extends Button
@export var nivel : int
@export var scene : String = ''
var animation_name : String  = ''

func _on_pressed():
	$"../../PixelArtResized1920x1080/AnimationPlayer".play(animation_name)
	
func _on_animation_player_animation_finished(anim_name):
	
	if anim_name == "fundido":
		get_tree().change_scene_to_file(scene)
	
