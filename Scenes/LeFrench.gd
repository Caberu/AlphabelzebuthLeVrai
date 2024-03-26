extends Node

@onready var path = "res://DB/fr.txt"
var frhash := {}

var simplification := {
	"ï":"i",
	"î":"i",
	"é":"e",
	"è":"e",
	"ê":"e",
	"ü":"u",
	"à":"a",
	"â":"a",
	"ô":"o"
}

func _ready():
	load_file(path)

func load_file(path):
	print("Start loading...")
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text().split("\n")
	for i in content:
		frhash[simplify(i).to_upper()] = i.length()
	print("Loaded all fucking french words!")
	return

func simplify(word : String) -> String:
	word = word.to_lower()
	var resultat = ""
	for l in word:
		if simplification.has(l):
			resultat = resultat+simplification[l]
		else:
			resultat = resultat + l
	return resultat

func word_valid(word : String):
	word = word.to_upper()
	return word.length()>=2 and frhash.has(word)
