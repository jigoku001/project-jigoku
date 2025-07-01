extends Node

var global_death = 0
var global_time = 0.0
var COLLECTION_ID = "jigoku stats"
var jigoku_name = "test"


var music : bool = true
var easy_mode : bool = true 




func _ready() -> void:
	pass
func _process(_delta: float) -> void:
	print(music)
	print(easy_mode)
	if music == false:
		AudioServer.set_bus_mute(0, true)
	else :
		AudioServer.set_bus_mute(0, false)
		
