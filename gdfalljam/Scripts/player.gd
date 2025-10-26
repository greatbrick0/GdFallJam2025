extends Actor

@export var flameObj: PackedScene
var prevFlamePos: Vector2
@export var flameSpacing: float = 32

func _ready():
	super._ready()
	prevFlamePos = global_position

func _physics_process(delta):
	HandleFlames()
	
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
	
	$Visuals.scale.x = (1 if facingRight else -1)
	move_and_slide()

func HandleFlames() -> void:
	if(global_position.distance_to(prevFlamePos) > flameSpacing):
		prevFlamePos = global_position
		var flameRef: NecromancyFlame = flameObj.instantiate()
		get_parent().add_child(flameRef)
		flameRef.global_position = global_position

func GetHit() -> void:
	LevelManager.StartTransition()

func DoHit() -> void:
	velocity.y = jumpForce
