extends Node2D

var bodyCount: int = 0
var pressed: bool = false

signal UsedPlate(bool)

func _on_triggger_area_body_entered(body):
	bodyCount += 1
	$Visuals/Sprite2D.texture = load("res://Sprites/Buttonbrighter.png")
	CheckPressed()

func _on_triggger_area_body_exited(body):
	bodyCount -= 1
	$Visuals/Sprite2D.texture = load("res://Sprites/Button.png")
	CheckPressed()

func CheckPressed() -> void:
	if(bodyCount > 0 != pressed):
		pressed = bodyCount > 0
		MusicManager.PlayGeneral(0)
		UsedPlate.emit(pressed)
