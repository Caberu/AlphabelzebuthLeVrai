extends Node2D

func get_hp(demon_name : String) -> int:
	return int(float(len(demon_name))/2)

func get_sprite(demon_name : String) -> Texture2D:
	return load("res://new4skeleton.png")

func initialize(demon_name : String):
	$"..".name = demon_name
	var hp : int = get_hp(demon_name)
	$"../Damageable".max_hp = hp
	var sprite : Texture2D = get_sprite(demon_name)
	$"../Sprite".texture = sprite
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("test"):
		$"../Damageable".damage(1)
		print("yo")
