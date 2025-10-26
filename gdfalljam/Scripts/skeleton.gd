extends Actor
class_name Skeleton

func _physics_process(delta):
	
	if is_on_wall():
		facingRight = !facingRight
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		velocity.x = 0
	else:
		velocity.x = speed * (1 if facingRight else -1)
	
	HandleMovement()

func GetHit(area: Area2D) -> void:
	if(area.get_parent() is Player):
		queue_free()
