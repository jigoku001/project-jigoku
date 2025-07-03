extends Area2D

var checkpoint_manager 
var easy_mode = false

func _ready() -> void:
	
	checkpoint_manager= get_parent().get_node("game_controller")
	print(easy_mode)
	if easy_mode == false:
		$".".monitoring=false
		$".".monitorable=false
		$".".visible = false

	
func _process(_delta: float) -> void:
		
		easy_mode = Global.easy_mode
		
		if easy_mode == true:
			$".".monitoring=true
			$".".monitorable=true
			$".".visible = true


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		checkpoint_manager.last_location = $Marker2D.global_position
		get_node("LogoInicio2").visible = false
