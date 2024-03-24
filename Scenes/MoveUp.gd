extends Node2D

var ok := false

var vitesse := 0.0

func start():
	ok = true
	
func _process(delta):
	if (!ok):
		return
	vitesse+= delta/2
	$"../..".global_position += Vector2(0,-300*delta)*vitesse/2
	if (vitesse > 100000):
		ok =false
