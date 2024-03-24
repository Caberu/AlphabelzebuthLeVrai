extends Node2D

var letter : String = "a"

func _on_damageable_death():
	var letter_node : Node2D = load("res://Scenes/letter.tscn").instantiate()
	letter_node.letter = letter
	$"../../".add_child(letter_node)
	letter_node.global_position = global_position
	$"../".queue_free()
