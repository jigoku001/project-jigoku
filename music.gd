extends Button

var is_muted := !Global.music

func _ready() -> void:
	if is_muted == false:
		$"../Label2".text= "on"
	elif is_muted == true:
		$"../Label2".text= "off"

func _on_pressed() -> void:
	if is_muted == false:
		is_muted = true
		Global.music = false
		$"../Label2".text= "off"
	elif is_muted == true:
		is_muted = false
		Global.music = true
		$"../Label2".text= "on"
