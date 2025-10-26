extends Actor

func _physics_process(delta):
	
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

func GetHit() -> void:
	LevelManager.StartTransition()

func DoHit() -> void:
	velocity.y = jumpForce
