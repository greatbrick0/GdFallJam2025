extends Actor

func _physics_process(delta):
	
	if is_on_wall():
		facingRight = !facingRight
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		velocity.x = 0
	else:
		velocity.x = speed * (1 if facingRight else -1)
	
	$Visuals.scale.x = (1 if facingRight else -1)
	move_and_slide()

func GetHit() -> void:
	queue_free()
