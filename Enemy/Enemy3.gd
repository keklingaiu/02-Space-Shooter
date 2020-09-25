extends KinematicBody2D

onready var HUD = get_node("/root/Game/HUD")

export var speed = Vector2(0,3)
export var speed_tween = 3.0
export var health = 100
export var points = 10
export var damage = 15

export var move_probability = 0.5
export var shoot_probability = 0.2

onready var Explosion = load("res://Explosion/Explosion.tscn")

onready var w = int(get_viewport_rect().size.x)
onready var h = int(get_viewport_rect().size.y)

onready var Bullet = load("res://Bullet/Bullet2.tscn")

func _ready():
	randomize()

func _physics_process(delta):
	position += (speed)/5

	if position.y > get_viewport().size.y + 100:
		queue_free()

func die():
	HUD.update_score(points)
	var explosion = Explosion.instance()
	explosion.position = position
	get_node("/root/Game/Explosions").add_child(explosion)
	explosion.get_node("Animation").play()
	queue_free()


func move():
	var new_position = Vector2(randi() % w, randi() % h)
	$Tween.interpolate_property(self, "position", position, new_position, speed_tween, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
	$Tween.start()

func shoot():
	var bullet = Bullet.instance()
	bullet.position = position + Vector2(0,20)
	get_node("/root/Game/Bullets").add_child(bullet)

func _on_Move_timeout():
	if randf() < move_probability:
		move()


func _on_Shoot_timeout():
	if randf() < shoot_probability:
		shoot()
