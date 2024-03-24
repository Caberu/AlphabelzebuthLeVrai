extends HealthBar

@onready var name_text : RichTextLabel = $NameTag
@onready var demon_name : String = $"../".name

func update_val(new_val : int):
	var char_num : int = ceili(float(new_val)/max_val*len(demon_name))
	name_text.text = "[center]" + demon_name.substr(0, char_num) + "[color=gray]" +\
					demon_name.substr(char_num, -1) + "[/color]"

func _ready():
	name_text.text = demon_name

func ascend():
	var instance = load("res://Scenes/ascend_fx.tscn").instantiate()
	instance.demon_name = demon_name
	instance.coord = global_position
	get_tree().current_scene.add_child(instance)
	instance.global_position = global_position
	get_tree().get_first_node_in_group("Word").set_unavailable_name(demon_name,true)
	$"..".queue_free()
	
func available():
	get_tree().get_first_node_in_group("Word").set_available_name(demon_name)
