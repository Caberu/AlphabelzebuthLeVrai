extends Node2D

var letter : String = "?"
var alphabet : String = "abcdefghijklmnopqrstuvwxyzaeiouyaeuoiuaeuoiueeeeauio"

func get_letter():
	if (letter == "?"):
		letter = alphabet[randi_range(0,alphabet.length()-1)]
	return letter

func _on_damageable_death():
	var letter_node : Node2D = load("res://Scenes/letter.tscn").instantiate()
	var fx = load("res://Scenes/death_fx.tscn").instantiate()
	get_tree().current_scene.add_child(fx)
	fx.global_position = global_position
	letter_node.letter = letter
	$"../../".add_child(letter_node)
	letter_node.global_position = global_position
	$"../".queue_free()
	
func gotohell():
	_on_damageable_death()
	var instance = load("res://Scenes/flamme_and_shake.tscn").instantiate()
	get_tree().get_first_node_in_group("FX").add_child(instance)
	instance.global_position = global_position + Vector2(5,-10)
	get_tree().get_first_node_in_group("Pentacle").lose_health()
