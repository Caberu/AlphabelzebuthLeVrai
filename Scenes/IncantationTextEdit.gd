extends TextEdit

@onready var word : Word = $"../../Word"

# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()

func _process(delta):
	set_caret_column(text.length())

func _on_text_changed():
	text = text.replace("\n","")
	text = text.replace(" ","")
	set_caret_column(text.length())
	if !$"../../Word".has_enough_letters(text):
		backspace(get_caret_line())
	word.change_word(text)
	
	
