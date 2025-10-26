extends Node2D

func _ready():
	$"Visuals/Sprite2D Fire".hide()

func _on_trigger_area_area_entered(area):
	$"Visuals/Sprite2D Fire".show()
	await get_tree().create_timer(0.35).timeout
	call_deferred("AttemptDestroyBridge")

func AttemptDestroyBridge() -> void:
	MusicManager.PlayGeneral(3)
	queue_free()
