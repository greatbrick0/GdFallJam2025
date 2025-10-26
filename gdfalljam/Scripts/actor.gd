extends CharacterBody2D
class_name Actor

@export  var speed = 300.0
@export var jumpForce = -500.0

var facingRight: bool = false

func _ready():
	$Hitbox.area_entered.connect(_on_hitbox_area_entered)

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	$Visuals.scale.x = (1 if facingRight else -1)
	move_and_slide()

func _on_hitbox_area_entered(area: Area2D):
	if(area.get_parent().velocity.y >= velocity.y):
		call_deferred("GetHit")
	else:
		call_deferred("DoHit")

func GetHit() -> void:
	print(name + " died")

func DoHit() -> void:
	print(name + " killed")
