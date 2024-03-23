extends Node2D

@export var letter : String


func _on_button_button_down():
	var alphabet : Alphabet = get_tree().get_first_node_in_group("Alphabet")
	alphabet.add_letter(letter)
	queue_free()
