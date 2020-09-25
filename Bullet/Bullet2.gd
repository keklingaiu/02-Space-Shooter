extends KinematicBody2D

export var velocity = Vector2(0, 10)
export var damage = 5

onready var HUD = get_node("/root/Game/HUD")
onready var Explosion = load("res://Explosion/Explosion.tscn")

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position += velocity
	if position.y > get_viewport_rect().size.y + 30:
		queue_free()
		
func die():
	var explosion = Explosion.instance()
	explosion.position = position
	get_node("/root/Game/Explosions").add_child(explosion)
	explosion.get_node("Animation").play()
	queue_free()

func _on_Damage_body_entered(body):
	queue_free()
