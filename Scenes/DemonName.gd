extends HealthBar

@onready var name_text : RichTextLabel = $NameTag
@onready var demon_name : String = $"../".name

func update_val(new_val : int):
	var char_num : int = ceili(float(new_val)/max_val*len(demon_name))
	name_text.text = "[center]" + demon_name.substr(0, char_num) + "[color=gray]" +\
					demon_name.substr(char_num, -1) + "[/color]"

func _ready():
	name_text.text = demon_name
	
