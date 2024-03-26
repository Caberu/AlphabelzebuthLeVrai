extends Node2D

@export var anim_player : AnimationPlayer
@onready var word : Word = $"../../../Word"

func _ready():
	$"../Sprite".hide()

func get_sprite(demon_name : String) -> String:
	return DemonStats.get_sprite(demon_name)

func preview_valid(demon_name : String) -> bool:
	return !(len(demon_name) < 2 or len(demon_name) > 9) and word.is_available_name(demon_name)

func update_preview(demon_name : String):
	if !preview_valid(demon_name):
		$"../Sprite".visible = false
	else:
		$"../Sprite".visible = true
		var sprite : String = get_sprite(demon_name)
		anim_player.play("mobs/" + sprite + "_run")

func _on_text_edit_text_changed():
	update_preview($"../../../UI/TextEdit".text)
