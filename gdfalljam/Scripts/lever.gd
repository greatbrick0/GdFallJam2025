extends Interactable

signal UsedLever(bool)
var switched: bool = false
@export var oneUse: bool = false

func Interact() -> void:
	if(oneUse and switched):
		print("failed")
		return
	switched = not switched
	$Visuals.scale.x = (1 if not switched else -1)
	MusicManager.PlayGeneral(0)
	UsedLever.emit(switched)
