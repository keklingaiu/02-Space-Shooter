extends KinematicBody2D

onready var HUD = get_node("/root/Game/HUD")

export var speed = Vector2(0,3)

export var health = 100
export var points = 10
export var damage = 15

export var shoot_probability = 0.5

onready var Explosion = load("res://Explosion/Explosion.tscn")

onready var w = int(get_viewport_rect().size.x)
onready var h = int(get_viewport_rect().size.y)

onready var Bullet = load("res://Bullet/Bullet2.tscn")

func _ready():
	randomize()

func _physics_process(delta):
	position += (speed)/3

	if position.y > get_viewport().size.y + 100:
		queue_free()

func die():
	HUD.update_score(points)
	var explosion = Explosion.instance()
	explosion.position = position
	get_node("/root/Game/Explosions").add_child(explosion)
	explosion.get_node("Animation").play()
	queue_free()


func shoot():
	var bullet = Bullet.instance()
	bullet.position = position + Vector2(0,20)
	get_node("/root/Game/Bullets").add_child(bullet)


func _on_Shoot_timeout():
	if randf() < shoot_probability:
		shoot()
