extends Node2D

func _on_damageable_death():
	var fx = load("res://Scenes/death_fx.tscn").instantiate()
	get_tree().current_scene.add_child(fx)
	fx.global_position = global_position
	$"../".queue_free()
