extends Control


func _on_return_button_pressed() -> void:
	LevelManager.StartTransition("res://Scenes/main_menu.tscn")
