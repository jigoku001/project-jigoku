extends AnimatableBody2D
	
func _process(_delta):
	global_position = get_parent().global_position 
	if $RayCast2D.is_colliding():
		self.queue_free()
		print("tocar")
