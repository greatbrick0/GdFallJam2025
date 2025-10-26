extends Node2D

@export var blockers: int = 0
@export var positions: Array[Vector2] = []
var targetPos: Vector2
@export var travelSpeed: float = 500

func _ready():
	targetPos = global_position

func AdjustBlockersByBool(newBool: bool) -> void:
	blockers -= 1 if newBool else -1
	targetPos = positions[blockers]
	
	for enemy in get_tree().get_nodes_in_group("skeletons"):
		enemy.can_move = false
		
	await get_tree().create_timer(1).timeout
	for enemy in get_tree().get_nodes_in_group("skeletons"):
		enemy.can_move = true

func AdjustBlockersByInt(newInt: int) -> void:
	blockers += newInt
	targetPos = positions[blockers]

func SetOpen() -> void:
	blockers = 0
	targetPos = positions[blockers]

func _physics_process(delta):
	var dist: float = global_position.distance_to(targetPos)
	global_position += global_position.direction_to(targetPos) * clampf(travelSpeed * delta, -dist, dist)
