extends Node2D

@export var anim_player : AnimationPlayer

var sprite_type := {
	3: "bat",
	4: "skeleton",
	5: "skeleton",
	6: "skeleton",
	7: "mage",
	8: "slime",
	9: "minotaur"
}

func get_sprite(demon_name : String) -> String:
	return sprite_type[len(demon_name)]


func update_preview(demon_name : String):
	if len(demon_name) < 3 or len(demon_name) > 9:
		$"../Sprite".visible = false
	else:
		$"../Sprite".visible = true
		var sprite : String = get_sprite(demon_name)
		anim_player.play("mobs/" + sprite + "_run")
	
	


func _on_text_edit_text_changed():
	update_preview($"../../UI/TextEdit".text)
