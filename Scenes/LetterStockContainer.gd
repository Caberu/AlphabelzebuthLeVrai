extends HBoxContainer

@export var alphabet : Alphabet
@export var letterUI_scene : PackedScene
var letters = []

func _ready():
	alphabet.on_update_letter_stock.connect(on_update_letter_stock)
	on_update_letter_stock()
	
func on_update_letter_stock():
	var letter_already_spawned = []
	
	for l : LetterUI in letters:
		letter_already_spawned.append(l.letter)
		if (l.n != alphabet.get_letter_count(l.letter)):
			l.set_n(alphabet.get_letter_count(l.letter))
	
	for l in alphabet.letters_stock.keys():
		if (!letter_already_spawned.has(l)):
			var instance = letterUI_scene.instantiate()
			instance.initialize(l, alphabet.get_letter_count(l))
			add_child(instance)
			letters.append(instance)
