class_name iniciar
extends Button

var scene := ''
func _ready() -> void:
	$".".disabled = true

func _on_timer_timeout() -> void:
	scene = Global.current_level
	print(scene)
	$".".disabled = false
	
func _on_pressed() -> void:
	$"../../PixelArtResized1920x1080/AnimationPlayer".play("fundido")




func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fundido":
		if scene != '':
			get_tree().change_scene_to_file(scene)
		
