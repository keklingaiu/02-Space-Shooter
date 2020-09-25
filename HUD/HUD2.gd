extends Control

onready var global = get_node("/root/Global")

func _ready():
	update_score(0)
	update_health(0)


func update_score(s):
	global.score += s
	$Score.text = "Score: " + str(global.score)
	if global.score >= 200 and global.level != 3:
		get_node("/root/Game/Level2").show()
		get_node("/root/Game/Level2").monitoring = true;

func update_health(h):
	global.health += h
	$Health.text = "Health: " + str(global.health)
	if global.health <= 0:
		get_tree().change_scene("res://Menu/Died.tscn")

