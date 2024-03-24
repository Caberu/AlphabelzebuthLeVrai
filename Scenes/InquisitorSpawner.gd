extends Node2D

@onready var inquisitor_scene : PackedScene = load("res://Scenes/inquisitor.tscn")


func _process(delta):
	if randf() < 0.05*delta:
		spawn_inquisitor()

func spawn_inquisitor():
	var instance : Node2D = inquisitor_scene.instantiate()
	instance.find_child("Walk").anim_string = "templar"
	instance.find_child("Sprite").flip_h = true
	$"../Inquisitors".add_child(instance)
	instance.global_position = global_position
	instance.global_position.y += 17
