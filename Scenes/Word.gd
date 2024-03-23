class_name Word extends Node

var correct := false
var word := ""
@onready var alphabet : Alphabet =  $"../Alphabet"

var letters_currently_used := {}

signal on_update_correctness

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

func change_word(new_word : String):
	word = new_word
	if (correct != alphabet.check_correctness(word)):
		correct = !correct
		on_update_correctness.emit()