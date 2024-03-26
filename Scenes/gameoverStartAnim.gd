extends Node2D

@export var sprite : Sprite2D

var go := false

var time := 0.0

func _on_button_down():
	sprite.texture = load("res://Scenes/start_buton2_0000.png")
	go = true
	$"..".shake(5,2)

func _process(delta):
	if (!go) : return
	
	time += delta
	if (time > 0.5):
		print("chanhe")
		$"..".hide()
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
