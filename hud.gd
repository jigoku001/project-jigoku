class_name HUD
extends CanvasLayer

var is_counting := true
var time_elapsed := 0.0
var player 
var death_counting = 00
var g_death_counting = 00
var COLLECTION_ID = "jigoku_stats"
var nivel = ''
var progress = Global.progress

@onready var timer_label = $HBoxContainer/MarginContainer/Timer
@onready var death_label = $HBoxContainer/MarginContainer2/Deathcounter
@onready var g_death_label = $HBoxContainer/MarginContainer2/Deathcounter2
func _ready():
	nivel = get_tree().current_scene.scene_file_path
	Global.current_level = nivel
	print(nivel)
	player = get_parent().get_node("player")
	get_tree().get_first_node_in_group("emisor").connect("save", save_to_cloud)
	

func _process(delta):
	add_death()
	
	if Global.global_time > 0:
		time_elapsed = Global.global_time
		
	if is_counting:
		Global.global_time += delta
		time_elapsed += delta
		timer_label.text = "⏱ Tiempo: %.2f" % time_elapsed

func add_death():
	death_counting = player.deaths
	g_death_counting = Global.global_death
	death_label.text = "💀 Muertes: %d" % death_counting
	g_death_label.text = "💀 g: %d" % g_death_counting

	
	
func save_to_cloud():
	
	var data = {
			"deaths" : g_death_counting,
			"time": time_elapsed,
			"nivel": nivel,
			"progress" : progress
	}
	print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
	print(data)
	var auth = Firebase.Auth.auth
	if auth.localid:
		var collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_ID)
		var task : FirestoreDocument = await collection.get_doc(auth.localid)		
		
		if task:
			print(task)
			print("-------------------------")
			task.add_or_update_field("fields",data)
			#var new := FirestoreDocument.new(data)
			print(task)
			var saved := await collection.update(task)

		else:
			var data1 = {
				"fields":{
					"deaths" : g_death_counting,
					"time": time_elapsed,
					"nivel": nivel,
					"progress" : progress
				}
			}
			print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
			print(data1)
			await collection.add(auth.localid,data1)
