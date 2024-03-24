class_name Word extends Node

var correct := false
var word := ""
@onready var alphabet : Alphabet =  $"../Alphabet"

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
	print(letters_currently_used)

func use_name(name : String):
	word = ""
	alphabet.remove_word(name)
	on_use_name.emit()

func set_unavailable_name(name : String, paradi := false):
	unavailbale_names[name] = paradi
	
func set_available_name(name : String):
	unavailbale_names.erase(name) #???? jsp si ça marche

func is_available_name(name: String) -> bool:
	return !unavailbale_names.has(name)

func change_word(new_word : String):
	word = new_word
	if (is_available_name(new_word) and correct != alphabet.check_correctness(word)):
		correct = !correct
		on_update_correctness.emit()
