extends Sprite2D

func _on_text_edit_text_changed():
	time = 1

var time := 0.0

func _process(delta):
	time = max(0.8, time-delta/2)
	modulate = lerp(Color.BLACK, Color(0,0,0,0), time)
