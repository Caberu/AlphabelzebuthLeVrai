class_name Alphabet extends Node2D

var letters_stock := {

}

signal on_update_letter_stock

func on_update_stock():
	on_update_letter_stock.emit()

func add_letter(letter : String, n := 1):
	letter = letter.to_upper()
	letters_stock[letter] = get_letter_count(letter)+n
	#on_update_letter_stock.emit()

func remove_letter(letter : String, n := 1):
	letter = letter.to_upper()
	letters_stock[letter] = max(0,get_letter_count(letter)-n)
	on_update_letter_stock.emit()

func get_letter_count(letter : String) -> int:
	letter = letter.to_upper()
	if (letters_stock.has(letter)):
		return letters_stock[letter]
	return 0

func check_correctness(word : String) -> bool:
	return $"../LeFrench".word_valid(word)

func remove_word(word : String):
	for l in word:
		remove_letter(l)

func add_word(word : String):
	for l in word:
		add_letter(l)
