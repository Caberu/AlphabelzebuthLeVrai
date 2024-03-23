extends TextEdit

@onready var word : Word = $"../../Word"
var old_text := ""

signal on_true_text_changed

# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()

func _process(delta):
	set_caret_column(text.length())

func _on_text_changed():
	text = text.replace("\n","")
	text = text.replace(" ","")
	if !$"../../Word".has_enough_letters(text):
		text =  old_text
	set_caret_column(text.length())
	word.change_word(text)
	on_true_text_changed.emit()
	old_text = text
	
