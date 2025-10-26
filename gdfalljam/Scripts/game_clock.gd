extends Node

var timing: bool = false
var time: float = 0

func _process(delta):
	if(timing):
		time += delta * 1.0

func GetTime() -> float:
	return time

func ContinueTiming() -> void:
	timing = true

func PauseTiming() -> void:
	timing = false
