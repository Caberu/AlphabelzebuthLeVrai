extends Node2D

func off():
	$Sprite2D/AnimationPlayer.play("Bougie_off")

	var instance = load("res://Scenes/flamme_and_shake.tscn").instantiate()
	get_tree().get_first_node_in_group("FX").add_child(instance)
	instance.global_position = global_position + Vector2(0,-10)
