extends Actor
class_name Player

@export var flameObj: PackedScene
var prevFlamePos: Vector2
@export var flameSpacing: float = 32

var interactTarget: Interactable = null

func _ready():
	super._ready()
	prevFlamePos = global_position

func _process(delta):
	if(interactTarget != null):
		$InteractMarker.global_position = interactTarget.global_position

func _physics_process(delta):
	HandleFlames()
	
	if(Input.is_action_just_pressed("interact")):
		if(interactTarget != null):
			interactTarget.Interact()
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpForce
	
	var direction = Input.get_axis("moveleft", "moveright")
	if direction:
		velocity.x = direction * speed
		facingRight = direction > 0
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	HandleMovement()

func HandleFlames() -> void:
	if(global_position.distance_to(prevFlamePos) > flameSpacing):
		prevFlamePos = global_position
		var flameRef: NecromancyFlame = flameObj.instantiate()
		get_parent().add_child(flameRef)
		flameRef.global_position = global_position

func GetHit(area: Area2D) -> void:
	LevelManager.StartTransition()

func DoHit(area: Area2D) -> void:
	velocity.y = jumpForce

func _on_interact_area_area_entered(area: Area2D):
	interactTarget = area.get_parent()
	$InteractMarker.visible = true

func _on_interact_area_area_exited(area: Area2D):
	if(area.get_parent() == interactTarget): 
		interactTarget = null
		$InteractMarker.visible = false
