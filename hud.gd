extends CanvasLayer

var is_counting := true
var time_elapsed := 0.0
var death_counting := 0

@onready var timer_label = $HBoxContainer/MarginContainer/Timer
@onready var death_label = $HBoxContainer/MarginContainer2/Deathcounter

func _process(delta):
	if is_counting:
		time_elapsed += delta
		timer_label.text = "⏱ Tiempo: %.2f" % time_elapsed

func reset_timer():
	time_elapsed = 0.0
	timer_label.text = "⏱ Tiempo: 0.00"

func add_death():
	death_counting += 1
	death_label.text = "💀 Muertes: %d" % death_counting
