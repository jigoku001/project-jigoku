class_name HUD
extends CanvasLayer

var is_counting := true
var time_elapsed := 0.0
var player 
var death_counting = 00
var g_death_counting = 00


@onready var timer_label = $HBoxContainer/MarginContainer/Timer
@onready var death_label = $HBoxContainer/MarginContainer2/Deathcounter
@onready var g_death_label = $HBoxContainer/MarginContainer2/Deathcounter2

func _ready():
	player = get_parent().get_node("player")

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
	
