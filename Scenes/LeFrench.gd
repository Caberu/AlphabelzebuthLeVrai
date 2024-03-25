extends Node

@onready var path = "res://DB/fr.txt"
var frhash := {}

func _ready():
	load_file(path)

func load_file(path):
	print("Start loading...")
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text().split("\n")
	for i in content:
		frhash[i.to_upper()] = i.length()
	print("Loaded all fucking french words!")
	return

func word_valid(word : String):
	word = word.to_upper()
	return word.length()>=2 and frhash.has(word)
