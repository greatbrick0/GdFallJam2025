extends Interactable

@export var decorative: bool = false
@export var blockers: int = 0

@export var nextLevel: String

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
