extends Interactable

@export var decorative: bool = false
@export var blockers: int = 0

@export var nextLevel: String

var doorSprite

func _ready():
	if(decorative):
		$Area2D.call_deferred("queue_free")
	doorSprite = $Visuals/Sprite2D

func _process(delta):
	if(blockers <= 0):
		doorSprite.texture = load("res://Sprites/door2 copyf5.png")
	else:
		doorSprite.texture = load("res://Sprites/door2 copy (1).png")

func Interact() -> void:
	if(decorative): return
	
	if(blockers > 0):
		MusicManager.PlayGeneral(1)
		return
	
	LevelManager.StartTransition(nextLevel)

func AdjustBlockersByBool(newBool: bool) -> void:
	blockers -= 1 if newBool else -1

func AdjustBlockersByInt(newInt: int) -> void:
	blockers += newInt
