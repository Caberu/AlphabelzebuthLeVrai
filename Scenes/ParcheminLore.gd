extends Node2D

var ok := false

func setok():
	ok = true

func _process(delta):
	if (!ok):
		return
		
	if (Input.is_action_just_pressed("Skip")):
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
