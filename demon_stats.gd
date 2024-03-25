extends Node


enum AttackerType {
	MELEE,
	RANGED
}

var attacker_scenes := {
	AttackerType.MELEE: load("res://Scenes/Melee.tscn"),
	AttackerType.RANGED: load("res://Scenes/Ranged.tscn")
}

var sprite_type := {
	2: "bat",
	3: "ghost",
	4: "skeleton",
	5: "mage",
	6: "slime",
	7: "minotaur"
}

#pas utilisé
var hp_type := {
	3: 1,
	4: 2,
	5: 2,
	6: 1,
	7: 6,
	8: 4
}

var dmg_type := {
	2: 1,
	3: 1,
	4: 2,
	5: 2,
	6: 0,
	7: 4
}

var speed_type := {
	2:20,
	3:9,
	4:9,
	5:7,
	6:5,
	7:6
}

func get_dmg(demon_name : String) -> int:
	#return dmg_type[len(demon_name)]*3
	return len(demon_name)

func get_hp(demon_name : String) -> int:
	#return hp_type[len(demon_name)]
	return demon_name.length()

func get_sprite(demon_name : String) -> String:
	return sprite_type[len(demon_name)]

func get_speed(demon_name : String):
	return speed_type[len(demon_name)]

func get_type(demon_name : String) -> AttackerType:
	if sprite_type[len(demon_name)] == "mage":
		return AttackerType.RANGED
	else:
		return AttackerType.MELEE
