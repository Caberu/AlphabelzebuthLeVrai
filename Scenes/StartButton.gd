extends Node2D

@export var sprite : Sprite2D

func _on_button_down():
	sprite.texture = load("res://Scenes/start_buton2_0000.png")
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
