extends Node2D

@export var speed : float = 5

@onready var parent : Node2D = $".."

var moving : bool = true

func _process(delta):
	if moving: move(delta)
	
func move(modifier : float = 1.0):
	parent.position.x += speed * modifier
	
func toggle_move():
	moving = !moving
	
