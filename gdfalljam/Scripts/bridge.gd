extends Node2D

func _on_trigger_area_area_entered(area):
	call_deferred("AttemptDestroyBridge")

func AttemptDestroyBridge() -> void:
	MusicManager.PlayGeneral(3)
	queue_free()
