class_name Letter extends Node2D

@export var letter : String
@onready var sound_player := AudioStreamPlayer.new()

func _on_button_button_down():
	var instance = load("res://letter_float_fx.tscn").instantiate()
	instance.get_node("LettreGFX").lettre = letter
	instance.get_node("FlyToCoord").start = global_position
	get_tree().current_scene.add_child(instance)
	instance.global_position = global_position
	
	var alphabet : Alphabet = get_tree().get_first_node_in_group("Alphabet")
	alphabet.add_letter(letter)
	
	$"../".add_child(sound_player)
	sound_player.stream = load("res://Sounds/collect_letter.ogg")
	sound_player.volume_db = -15
	sound_player.pitch_scale *= randf_range(0.9, 1.1)
	sound_player.play()
	
	queue_free()

func _on_button_mouse_entered():
	_on_button_button_down()
