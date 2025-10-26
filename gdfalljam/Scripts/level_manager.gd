extends Node

var currentLevel: String = "res://Scenes/test_level_1.tscn"
var midTransition: bool = false

func _process(delta):
	if(Input.is_action_just_released("reset")):
		StartTransition()

func ResetLevel() -> void:
	get_tree().change_scene_to_file(currentLevel)

func StartTransition(newLevel: String = "") -> bool:
	if(midTransition): return false
	
	midTransition = true
	if(newLevel == ""): newLevel = currentLevel
	currentLevel = newLevel
	$ScreenFade.play("FadeOut")
	return true

func _on_screen_fade_animation_finished(anim_name):
	if(anim_name == "FadeOut"):
		ResetLevel()
		$ScreenFade.play("FadeIn")
	if(anim_name == "FadeIn"):
		midTransition = false
