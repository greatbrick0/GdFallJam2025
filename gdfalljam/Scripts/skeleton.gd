extends Actor
class_name Skeleton

var collapsed: bool = false

func _ready():
	super._ready()

func _physics_process(delta):
	if(not collapsed):
		FacePlayer()
		
		#if is_on_wall():
			#print("bounce off wall")
			#facingRight = !facingRight
		
		if not is_on_floor():
			velocity += get_gravity() * delta
			velocity.x = 0
		elif (position.x >= GetPlayerPos() - 4 && position.x <= GetPlayerPos() + 4):
			velocity.x = 0
		else:
			velocity.x = speed * (1 if facingRight else -1)
		
	else:
		velocity += get_gravity() * delta
		velocity.x = 0
	
	HandleMovement()

func GetHit(area: Area2D) -> void:
	if(area.get_parent() is Player):
		collapsed = true
		$Visuals/AnimatedSprite2D.visible = false
		$Visuals/Sprite2D.visible = true
		MusicManager.PlayGeneral(2)
		$Hitbox.call_deferred("shape_owner_set_disabled", 0, true)

func Respawn() -> void:
	FacePlayer()
	collapsed = false
	$Visuals/AnimatedSprite2D.visible = true
	$Visuals/Sprite2D.visible = false
	$Hitbox.call_deferred("shape_owner_set_disabled", 0, false)

func GetPlayerPos() -> float:
	return get_tree().get_nodes_in_group("PlayerGroup")[0].position.x

func FacePlayer() -> void:
	facingRight = get_tree().get_nodes_in_group("PlayerGroup")[0].global_position.x > global_position.x
