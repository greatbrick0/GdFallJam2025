extends Control


func _on_play_button_pressed() -> void:
	LevelManager.StartTransition("res://Scenes/Levels/level_0.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
