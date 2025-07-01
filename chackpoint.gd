extends Area2D

var checkpoint_manager 
var easy_mode = Global.easy_mode

func _ready() -> void:
	
	checkpoint_manager= get_parent().get_node("game_controller")
	print(easy_mode)
	if easy_mode == false:
		$".".queue_free()
	
	

	


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		checkpoint_manager.last_location = $Marker2D.global_position
