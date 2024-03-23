extends Node2D

@export var demon_scene : PackedScene

signal on_spanw_del

func _on_click():
	instantiate_demon(demon_scene)

func instantiate_demon(scene : PackedScene):
	var instance : Node2D = scene.instantiate()
	$"../Demons".add_child(instance)
	instance.global_position = global_position
	
	on_spanw_del.emit()
	
