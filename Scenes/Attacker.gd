class_name Attacker extends Node2D

@export var enemy_group : String
@export var radius : float
@export var cooldown : float
@export var dmg : int

var cooldown_stop : float = 0.0

func get_enemy() -> Node2D:
	return null
	
func attack(enemy : Node2D):
	pass
	
func get_distance(other : Node2D) -> float:
	return abs(other.global_position.x-global_position.x) 
