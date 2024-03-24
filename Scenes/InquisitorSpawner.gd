extends Node2D

@onready var inquisitor_scene : PackedScene = load("res://Scenes/inquisitor.tscn")


enum AttackerType {
	MELEE,
	RANGED
}

var attacker_scenes := {
	AttackerType.MELEE: load("res://Scenes/Melee.tscn"),
	AttackerType.RANGED: load("res://Scenes/Ranged.tscn")
}

func get_dmg(val : int) -> int:
	return 1

func get_hp(val : int) -> int:
	return max(int(float(val)/3), 1)

func get_sprite(val : int) -> String:
	if val <= 5:
		return "templar"
	elif val <= 7:
		return "archer"
	else:
		return "bigman"

func get_type(val : int) -> AttackerType:
	if get_sprite(val) == "archer":
		return AttackerType.RANGED
	else:
		return AttackerType.MELEE

func _process(delta):
	if randf() < 0.05*delta:
		spawn_inquisitor()

func spawn_inquisitor():
	var val : int = randi_range(0, 7)
	
	var instance : Node2D = inquisitor_scene.instantiate()
	
	instance.find_child("Walk").anim_string = get_sprite(val)
	instance.find_child("Sprite").flip_h = true
	
	var hp : int = get_hp(val)
	instance.find_child("Damageable").max_hp = hp
	
	var type : AttackerType = get_type(val)
	var instance2 : Attacker = attacker_scenes[type].instantiate()
	instance2.enemy_group = "Demons"
	instance2.dmg = get_dmg(val)
	instance2.cooldown = 1
	instance.add_child(instance2)
	
	$"../Inquisitors".add_child(instance)
	instance.global_position = global_position
	instance.global_position.y += 17
