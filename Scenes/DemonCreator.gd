extends Node2D

func get_hp(demon_name : String) -> int:
	return len(demon_name)

func initialize(demon_name : String):
	var hp : int = get_hp(demon_name)
	#$"../Damageable".set_hp(hp)
	$"../Damageable".max_hp = hp
	print("inst")
	$"..".name = demon_name
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("test"):
		$"../Damageable".damage(1)
		print("yo")
