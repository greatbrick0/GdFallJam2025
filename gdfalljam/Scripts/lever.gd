extends Interactable

var switched: bool = false

func Interact() -> void:
	switched = not switched
	$Visuals.scale.x = (1 if switched else -1)
