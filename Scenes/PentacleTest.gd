extends Sprite2D


@export var bougies := []

func _ready():
	bougies = get_children()

func lose_health():
	if (bougies.size() == 1):
		lose()
		return
	
	var a = bougies.pop_back()
	a.off()
		
func lose():
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
