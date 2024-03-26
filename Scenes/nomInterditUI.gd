extends Label




func _on_text_edit_on_true_text_changed():
	visible = !$"../../Word".is_available_name($"../../Word".word)
