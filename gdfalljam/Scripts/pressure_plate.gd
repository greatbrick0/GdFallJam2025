extends Node2D

var bodyCount: int = 0

signal UsedPlate(bool)

func _on_triggger_area_body_entered(body):
	bodyCount += 1

func _on_triggger_area_body_exited(body):
	bodyCount -= 1
