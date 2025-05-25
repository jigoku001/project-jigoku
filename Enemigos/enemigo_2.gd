class_name Roca
extends RigidBody2D

@export var demasiado_abajo = 1000

func _process(delta):
	if position. y > demasiado_abajo:
		queue_free()


func _on_body_entered(body):
	if body is Prueba:
		print("Jugador herido")
