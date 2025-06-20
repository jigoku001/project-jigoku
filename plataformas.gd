extends Node2D

const PLATAFORM_2 = preload("res://movin_platform_2.tscn")

func launch_platform():
	var instance_platform = PLATAFORM_2.instantiate()
	instance_platform.position = $".".position
	add_child(instance_platform)
