extends Sprite2D


@onready var bougies := [
	$Bougie,
	$Bougie2,
	$Bougie3,
	$Bougie4,
	$Bougie5
]

var lost := false

func lose_health():
	if (bougies.size() == 0):
		return
		
	var a = bougies.pop_back()
	a.off()
	
	if (bougies.size() == 0):
		lose()

func lose():
	lost = true
	get_tree().current_scene.add_child(load("res://game_over.tscn").instantiate())


var time := 0.0

@onready var spawncd := 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (lost == false) : return
	time += delta
	
	if (time > spawncd):
		spawn()
		spawncd = time + 0.1

func spawn():
	var fx = load("res://Animation/FlameFX.tscn").instantiate()
	get_tree().current_scene.add_child(fx)
	fx.global_position = Vector2(randf_range(100,500),randf_range(50,300))
