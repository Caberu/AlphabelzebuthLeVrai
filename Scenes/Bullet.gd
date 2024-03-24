class_name Bullet extends Node2D

var target : Node2D
var speed := 50.0
var hit_range := 5.0
var dmg := 1

func _process(delta):
	if target != null:
		var dist = target.global_position.x - global_position.x
		if abs(dist) > hit_range:
			var direction := 1.0 if dist > 0 else -1.0
			global_position.x += direction*speed*delta
		else:
			target.find_child("Damageable").damage(dmg)
			queue_free()
	else:
		queue_free()
