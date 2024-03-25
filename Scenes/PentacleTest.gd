extends Sprite2D


@onready var bougies := [
	$Bougie,
	$Bougie2,
	$Bougie3,
	$Bougie4,
	$Bougie5
]

func lose_health():
	if (bougies.size() == 1):
		lose()
		return
	
	var a = bougies.pop_back()
	a.off()

func lose():
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
