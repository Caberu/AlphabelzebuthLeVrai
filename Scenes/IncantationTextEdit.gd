extends TextEdit

@onready var word : Word = $"../../Word"
var old_text := ""

signal on_true_text_changed

# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()
	word.on_use_name.connect(reset_name)

func reset_name():
	text = ""
	old_text = ""
	text_changed.emit()

func _process(delta):
	set_caret_column(text.length())

func _on_text_changed():
	text = text.replace("\n","")
	text = text.replace(" ","")
	if !$"../../Word".has_enough_letters(text):
		text =  old_text
	else:
		spawn_fx()
	set_caret_column(text.length())
	word.change_word(text)
	on_true_text_changed.emit()
	old_text = text

func spawn_fx():
	var instance = load("res://Scenes/flamme_and_shake.tscn").instantiate()
	get_tree().get_first_node_in_group("FX").add_child(instance)
	instance.global_position = global_position + Vector2(15.1*(text.length()),0)
