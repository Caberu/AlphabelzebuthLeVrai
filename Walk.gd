extends Node2D

@export var speed : float = 5

func _process(delta):
	$"..".global_position += Vector2(delta * speed,0)
