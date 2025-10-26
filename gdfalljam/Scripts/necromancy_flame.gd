extends Node2D
class_name NecromancyFlame

var age: float = 0.0
@export var lifetime: float = 0.5

func _process(delta):
	age += delta * 1.0
	if(age >= lifetime):
		queue_free()
