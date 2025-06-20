extends Node

var current_level = level

func _ready() -> void:
	pass
	
func current_level_changed(level):
	current_level = level
func save_game():
	var file = File.new()
	file.open('res://data.save', file.WRITE)
