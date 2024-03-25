extends Label




func _on_text_edit_on_true_text_changed():
	visible = Paradi.has_ascended($"../../Word".word)
