extends Node2D


func initialize(demon_name : String):
	$"..".name = demon_name
	
	var hp : int = DemonStats.get_hp(demon_name)
	$"../Damageable".max_hp = hp
	
	var sprite : String = DemonStats.get_sprite(demon_name)
	$"../Walk".anim_string = sprite
	
	var speed = DemonStats.get_speed(demon_name)
	$"../Walk".speed = speed
	
	var type : DemonStats.AttackerType = DemonStats.get_type(demon_name)
	var instance : Attacker = DemonStats.attacker_scenes[type].instantiate()
	instance.enemy_group = "Inquisitors"
	instance.dmg = DemonStats.get_dmg(demon_name)
	$"..".add_child(instance)
	

