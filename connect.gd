extends Node

var scene :String = "res://main.tscn"

func _ready() -> void:
	Firebase.Auth.login_succeeded.connect(on_login_succeeded)
	Firebase.Auth.signup_succeeded.connect(on_signup_succeeded)
	Firebase.Auth.login_failed.connect(on_login_failed)
	Firebase.Auth.signup_failed.connect(on_signup_failed)
	
	if Firebase.Auth.check_auth_file():
		$VBoxContainer/Label.text = "autenticado"
		call_deferred("change_to_main_scene")

func change_to_main_scene():
	get_tree().change_scene_to_file(scene)
		
func _on_button_pressed() -> void:
	var email = $VBoxContainer/TextEdit.text
	var password = $VBoxContainer/TextEdit2.text
	Firebase.Auth.login_with_email_and_password(email, password )
	$VBoxContainer/Label.text = "autenticado"
	$VBoxContainer/Timer.start()

func _on_button_2_pressed() -> void:
	var email = $VBoxContainer/TextEdit.text
	var password = $VBoxContainer/TextEdit2.text
	Firebase.Auth.signup_with_email_and_password(email, password )
	$VBoxContainer/Label.text = "registrado "
	
func on_login_succeeded(Auth):
	print(Auth)
	$VBoxContainer/Label.text= "autenticacion exitosa"
	Firebase.Auth.save_auth(Auth)
	
func on_signup_succeeded(Auth):
	print(Auth)
	$VBoxContainer/Label.text= "registro exitoso"

func on_login_failed(error_code, message):
	print(error_code)
	print(message)
	$VBoxContainer/Label.text= "autenticacion fallo: $% " + message

func on_signup_failed(error_code, message):
	print(error_code)
	print(message)
	$VBoxContainer/Label.text= "registro fallo: $% " +  message

func _on_timer_timeout() -> void:
	call_deferred("change_to_main_scene")
	
