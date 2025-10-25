extends CharacterBody2D


@export  var speed = 300.0
@export var jumpForce = -500.0

var facingRight: bool = false

func _physics_process(delta):
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpForce
	
	var direction = Input.get_axis("moveleft", "moveright")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	move_and_slide()
