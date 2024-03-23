extends Label

@onready var text_edit : TextEdit = $"../TextEdit"



func _on_text_edit_text_changed():
	text = text_edit.text
