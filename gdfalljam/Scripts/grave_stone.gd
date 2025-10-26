extends Node2D

@export var skeleObj: PackedScene
var skeleRef: Skeleton 

func _on_trigger_area_area_entered(area):
	call_deferred("AttemptSpawnSkeleton")

func AttemptSpawnSkeleton() -> void:
	skeleRef = skeleObj.instantiate()
	get_parent().add_child(skeleRef)
	skeleRef.global_position = global_position
