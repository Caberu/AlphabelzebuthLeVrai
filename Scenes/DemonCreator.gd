extends Node2D

enum AttackerType {
	MELEE,
	RANGED
}

var attacker_scenes := {
	AttackerType.MELEE: load("res://Scenes/Melee.tscn"),
	AttackerType.RANGED: load("res://Scenes/Ranged.tscn")
}

var sprite_type := {
	3: "bat",
	4: "ghost",
	5: "skeleton",
	6: "skeleton",
	7: "mage",
	8: "slime",
	9: "minotaur"
}

var hp_type := {
	3: 1,
	4: 2,
	5: 2,
	6: 2,
	7: 1,
	8: 6,
	9: 4
}

var dmg_type := {
	3: 1,
	4: 1,
	5: 2,
	6: 2,
	7: 2,
	8: 0,
	9: 4
}

func get_dmg(demon_name : String) -> int:
	return dmg_type[len(demon_name)]

func get_hp(demon_name : String) -> int:
	return hp_type[len(demon_name)]

func get_sprite(demon_name : String) -> String:
	return sprite_type[len(demon_name)]

func get_type(demon_name : String) -> AttackerType:
	if sprite_type[len(demon_name)] == "mage":
		return AttackerType.RANGED
	else:
		return AttackerType.MELEE

func initialize(demon_name : String):
	$"..".name = demon_name
	
	var hp : int = get_hp(demon_name)
	$"../Damageable".max_hp = hp
	
	var sprite : String = get_sprite(demon_name)
	$"../Walk".anim_string = sprite
	
	var type : AttackerType = get_type(demon_name)
	var instance : Attacker = attacker_scenes[type].instantiate()
	instance.enemy_group = "Inquisitors"
	instance.dmg = get_dmg(demon_name)
	$"..".add_child(instance)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("test"):
		$"../Damageable".damage(1)
