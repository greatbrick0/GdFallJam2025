extends Node

var currentLevel: String = "res://Scenes/test_level_1.tscn"

func _process(delta):
	if(Input.is_action_just_released("reset")):
		get_tree().change_scene_to_file(currentLevel)
