extends Node2D

@export var sprite : Sprite2D

func _on_button_down():
	sprite.texture = load("res://Scenes/start_buton2_0000.png")
	$"..".add_child(load("res://Main_Menu_Dark.tscn").instantiate())
