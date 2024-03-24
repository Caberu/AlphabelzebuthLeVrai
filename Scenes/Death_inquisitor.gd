extends Node2D

var letter : String = "?"
var alphabet : String = "abcdefghijklmnopqrstuvwxyz"

func get_letter():
	if (letter == "?"):
		letter = alphabet[randi_range(0,25)]
	return letter

func _on_damageable_death():
	var letter_node : Node2D = load("res://Scenes/letter.tscn").instantiate()
	letter_node.letter = letter
	$"../../".add_child(letter_node)
	letter_node.global_position = global_position
	$"../".queue_free()
