extends Node2D

var last_location 
var player


<<<<<<< HEAD


func _ready() -> void:
	
	
=======
func _ready() -> void:
>>>>>>> 01f9b2780bafb02f0eef50339f40e79d3ea4d92b
	player = get_parent().get_node("player")
	last_location= player.global_position
