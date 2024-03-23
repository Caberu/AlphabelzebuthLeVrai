extends Node2D

@export var demon_scene : PackedScene


func _on_click():
	instantiate_demon(demon_scene)

func instantiate_demon(scene : PackedScene):
	var instance : Node2D = scene.instantiate()
	instance.get_node("DemonCreator").initialize("Quoicoubakaaa")
	$"../Demons".add_child(instance)
	instance.global_position = global_position

	
