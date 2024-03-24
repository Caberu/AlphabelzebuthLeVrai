extends Node2D

@onready var inquisitor_scene : PackedScene = load("res://Scenes/inquisitor.tscn")


func _process(delta):
	if randf() < 0.05*delta:
		spawn_inquisitor()

func spawn_inquisitor():
	var instance : Node2D = inquisitor_scene.instantiate()
	$"../Inquisitors".add_child(instance)
	instance.global_position = global_position
