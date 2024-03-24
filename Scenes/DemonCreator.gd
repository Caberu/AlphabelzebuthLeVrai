extends Node2D

enum AttackerType {
	MELEE,
	RANGED
}

var attacker_scenes := {
	AttackerType.MELEE: load("res://Scenes/Melee.tscn")
}


func get_hp(demon_name : String) -> int:
	return int(float(len(demon_name)))

func get_sprite(demon_name : String) -> Texture2D:
	return load("res://sprite_alphabelzebuth.png")

func get_type(demon_name : String) -> AttackerType:
	return AttackerType.MELEE

func initialize(demon_name : String):
	$"..".name = demon_name
	
	var hp : int = get_hp(demon_name)
	$"../Damageable".max_hp = hp
	
	var sprite : Texture2D = get_sprite(demon_name)
	$"../Sprite".texture = sprite
	
	var type : AttackerType = get_type(demon_name)
	var instance : Attacker = attacker_scenes[type].instantiate()
	instance.enemy_group = "Inquisitors"
	$"..".add_child(instance)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("test"):
		$"../Damageable".damage(1)
