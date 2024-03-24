extends Node2D

@export var letter : String

func _on_button_button_down():
	var instance = load("res://letter_float_fx.tscn").instantiate()
	instance.get_node("LettreGFX").lettre = letter
	instance.get_node("FlyToCoord").start = global_position
	get_tree().current_scene.add_child(instance)
	instance.global_position = global_position
	
	var alphabet : Alphabet = get_tree().get_first_node_in_group("Alphabet")
	alphabet.add_letter(letter)
	queue_free()
