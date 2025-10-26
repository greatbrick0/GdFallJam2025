extends Node2D

@export var blockers: int = 0
var open: bool = false

func AdjustBlockersByBool(newBool: bool) -> void:
	blockers -= 1 if newBool else -1
	CheckOpen()

func AdjustBlockersByInt(newInt: int) -> void:
	blockers += newInt
	CheckOpen()

func SetOpen() -> void:
	blockers = 0
	CheckOpen()

func CheckOpen() -> void:
	open = blockers <= 0
	$StaticBody2D.call_deferred("shape_owner_set_disabled", 0, open)
	$Visuals/Sprite2D.visible = !open
