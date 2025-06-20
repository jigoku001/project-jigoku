extends Area2D



func _on_body_entered(body):
	if body.is_in_group("Player"):
		self.visible = false
		$Timer.start()
	
			


func _on_timer_timeout() -> void:
	self.visible= true
	
