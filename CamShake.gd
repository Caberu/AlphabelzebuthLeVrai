extends Node2D

@export var time : float = 0.5
@export var force : float = 1

@onready var cam : MainCamera = get_tree().get_first_node_in_group("Camera")

func shake():
	cam.shake(time,force)
