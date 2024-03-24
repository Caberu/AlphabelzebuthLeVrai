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
	6: "mage",
	7: "slime",
	8: "minotaur"
}

var hp_type := {
	3: 1,
	4: 2,
	5: 2,
	6: 1,
	7: 6,
	8: 4
}

var dmg_type := {
	3: 1,
	4: 1,
	5: 2,
	6: 2,
	7: 0,
	8: 4
}

func get_dmg(demon_name : String) -> int:
	#return dmg_type[len(demon_name)]*3
	return len(demon_name)

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
	

