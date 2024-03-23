extends TextEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()




func _on_text_changed():
	text = text.replace("\n","")
	text = text.replace(" ","")
	set_caret_column(text.length())
