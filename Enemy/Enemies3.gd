extends Node2D

onready var Enemy = load("res://Enemy/Enemy3.tscn")
export var prob = 1.0
export var max_count = 10.0

onready var width = get_viewport().size.x

func _on_Timer_timeout():
	if randf() < prob and get_child_count() < max_count + 1:
		var enemy = Enemy.instance()
		enemy.position.x = randi() % int(width)
		enemy.speed = Vector2(0, (randi() % 5)+1)
		add_child(enemy)
		
		
