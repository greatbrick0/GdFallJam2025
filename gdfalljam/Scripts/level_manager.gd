extends Node

var currentLevel: String = "res://Scenes/test_level_1.tscn"
var midTransition: bool = false

func _process(delta):
	if(Input.is_action_just_released("reset")):
		StartTransition()

func ResetLevel() -> void:
	get_tree().change_scene_to_file(currentLevel)

func StartTransition(newLevel: String = "") -> void:
	if(midTransition): return
	
	midTransition = true
	if(newLevel == ""): newLevel = currentLevel
	currentLevel = newLevel
	$ScreenFade.play("FadeOut")

func _on_screen_fade_animation_finished(anim_name):
	if(anim_name == "FadeOut"):
		ResetLevel()
		$ScreenFade.play("FadeIn")
	if(anim_name == "FadeIn"):
		midTransition = false
