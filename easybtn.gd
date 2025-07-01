extends Button

var easy  := Global.easy_mode

func _ready() -> void:
	if easy == false:
		$"../Label".text= "off"
	elif easy == true:
		$"../Label".text= "on"
	print(easy)

func _on_pressed() -> void:
	
	if easy == false:
		Global.easy_mode = true
		$"../Label".text= "on"
	elif easy == true:
		Global.easy_mode = false
		$"../Label".text= "off"
