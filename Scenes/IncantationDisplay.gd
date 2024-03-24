extends Label

@onready var text_edit : TextEdit = $"../TextEdit"



func _on_text_edit_text_changed():
	time = 0
	text = text_edit.text

var time := 0.0

func _process(delta):
	time = min(1, time+delta*5)
	self_modulate = (lerp(Color.WHITE, Color.RED, time))
	print(time)
