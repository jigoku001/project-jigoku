class_name HUD
extends CanvasLayer

var is_counting := true
var time_elapsed := 0.0
var player 
var death_counting = 00


@onready var timer_label = $HBoxContainer/MarginContainer/Timer
@onready var death_label = $HBoxContainer/MarginContainer2/Deathcounter

func _ready():
	player = get_parent().get_node("player")

func _process(delta):
	add_death()
	if is_counting:
		time_elapsed += delta
		timer_label.text = "⏱ Tiempo: %.2f" % time_elapsed

func add_death():
	death_counting = player.deaths
	death_label.text = "💀 Muertes: %d" % death_counting
