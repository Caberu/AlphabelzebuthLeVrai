class_name Game extends Node2D


@onready var lines := [
	$Line,
	$Line2,
	$Line3
]

func _ready():
	for i in range(lines.size()):
		lines[i].get_node("Portal").idx = i
