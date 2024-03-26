extends Node2D


var time := 0.0

@onready var spawncd := randf()*10 +3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	
	if (time > spawncd):
		spawn()
		spawncd = time + randf()*10 +3

func spawn():
	var letter : Letter = load("res://Scenes/letter.tscn").instantiate()
	var fx = load("res://Animation/FlameFX.tscn").instantiate()
	
	letter.set_random()
	
	get_tree().current_scene.add_child(letter)
	letter.add_child(fx)
	letter.global_position = Vector2(randf_range(100,500),randf_range(50, 200))
	fx.position = Vector2(5,-28)
