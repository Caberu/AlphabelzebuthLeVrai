extends Node2D

var demon_name : String
var letters : Array[Letter]
var coord

func _ready():
	var scene : PackedScene = load("res://Scenes/letter.tscn")
	for i in demon_name:
		var letter : Letter = scene.instantiate()
		letter.letter = i
		get_tree().current_scene.add_child(letter)
		letter.global_position = coord + Vector2.from_angle(randf()*1000)*10
		letters.append(letter)

func click():
	if (letters.size() == 0):
		queue_free()
		return
	
	var l = letters.pop_back()
	l._on_button_button_down()

