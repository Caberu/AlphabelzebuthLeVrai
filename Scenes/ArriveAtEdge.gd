extends Node2D

enum SIDE{
	PLAYER,
	INQUISITION
}

@export var side : SIDE

signal arrive_at_edge

func _process(delta):
	if (side == SIDE.PLAYER):
		if (global_position.x > 580):
			arrive_at_edge.emit()
	elif (side == SIDE.INQUISITION):
		if (global_position.x < 20):
			arrive_at_edge.emit()
	
