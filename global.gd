extends Node

var global_death = 0
var global_time = 0.0
var COLLECTION_ID = "jigoku_stats"
var current_level = ""
var progress = 1
#var delta = 0


var music : bool = true
var easy_mode : bool = false


func load_from_cloud():
	var auth = Firebase.Auth.auth
	if auth.localid :
		var collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_ID)
		var task = await collection.get_doc(auth.localid)
		if task:
			var result = task.get_value("fields")
			global_death = result.deaths
			global_time = result.time
			current_level = result.nivel
			progress = result.progress
			
			print(task)
		else :
			current_level = "res://level_2.tscn"
				
	else: 
		pass
	
func _ready() -> void:
	call_deferred("load_from_cloud")
	
	
func _process(_delta: float) -> void:
	
	#print(music)
	#print(easy_mode)
	#print(current_level)
	
	
	if global_death > 30:
		easy_mode = true
	if music == false:
		AudioServer.set_bus_mute(0, true)
	else :
		AudioServer.set_bus_mute(0, false)



	
