class_name Word extends Node

var correct := false
var word := ""
@onready var alphabet : Alphabet = $"../Alphabet"
@onready var sound_player := AudioStreamPlayer.new()

var unavailbale_names := {} #hash map (en plus, true si il est au paradi)
var letters_currently_used := {}

signal on_update_correctness
signal on_use_name


func has_enough_letters(new_word : String) -> bool:
	word = new_word
	update_letter_used()
	for l in letters_currently_used.keys():
		if (alphabet.get_letter_count(l) < letters_currently_used[l]):
			return false
	return true

func update_letter_used():
	letters_currently_used = {}
	for l in word:
		if (!letters_currently_used.has(l.to_upper())):
			letters_currently_used[l.to_upper()] = 0
		letters_currently_used[l.to_upper()] = letters_currently_used[l.to_upper()]+1

	sound_player.stream = load("res://Sounds/keyboard.ogg")	
	sound_player.volume_db = 0
	sound_player.pitch_scale *= randf_range(0.95, 1.05)
	var clone_player = sound_player.duplicate()
	add_child(clone_player)
	clone_player.play()

func use_name(name : String):
	word = ""
	alphabet.remove_word(name)
	on_use_name.emit()
	
	for child in get_children():
		if child is AudioStreamPlayer:
			child.queue_free()
	
	sound_player.stream = load("res://Sounds/enter_word.ogg")	
	sound_player.volume_db = -13
	sound_player.pitch_scale *= randf_range(0.95, 1.05)
	var clone_player = sound_player.duplicate()
	add_child(clone_player)
	clone_player.play()


func set_unavailable_name(name : String, _paradi := false):
	unavailbale_names[name] = _paradi
	Paradi.unavailable = unavailbale_names
	
func set_available_name(name : String):
	unavailbale_names.erase(name) #???? jsp si ça marche

func is_available_name(name: String) -> bool:
	return !unavailbale_names.has(name.to_lower().reverse().capitalize())

func change_word(new_word : String):
	word = new_word
	if (is_available_name(new_word) and correct != alphabet.check_correctness(word)):
		correct = !correct
		on_update_correctness.emit()
