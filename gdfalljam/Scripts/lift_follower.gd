extends Node2D

@export var target: Node2D
var offset: Vector2

func _ready():
	offset = global_position - target.global_position

func _process(delta):
	global_position = target.global_position + offset
