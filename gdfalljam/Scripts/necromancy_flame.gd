extends Node2D
class_name NecromancyFlame

var age: float = 0.0
@export var lifeTime: float = 0.5
@export var activateTime: float = 0.2

func _process(delta):
	age += delta * 1.0
	if(age >= activateTime):
		$TriggerArea.call_deferred("shape_owner_set_disabled", 0, false)
	if(age >= lifeTime):
		queue_free()
