extends Node2D


func _on_damageable_death():
	$"../".queue_free()
