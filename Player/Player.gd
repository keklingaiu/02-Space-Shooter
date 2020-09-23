extends KinematicBody2D

onready var HUD = get_node("/root/Game/HUD")
export var speed = 2


func _physics_process(delta):
	position += get_input()*speed
	if Input.is_action_pressed("shoot") and not $Laser.is_casting:
		$Laser.fire(get_viewport().get_mouse_position())
	elif $Laser.is_casting:
		$Laser.stop()
   


func get_input():
	var input_dir = Vector2(0,0)
	if Input.is_action_pressed("left"):
		input_dir.x -= 1*speed
	if Input.is_action_pressed("right"):
		input_dir.x += 1*speed
	return input_dir.rotated(rotation)


func _on_Damage_body_entered(body):
   HUD.update_health(-body.damage)
   body.die()
