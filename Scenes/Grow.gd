extends Node2D

var ok := false

@export var curve : Curve

var time := 0.0

signal on_open_parchemin

func start():
	ok = true
	
func _process(delta):
	if (!ok):
		return
	time += delta/10.0
	$"..".scale = Vector2.ONE * curve.sample(time)
	$"../Sprite2D".modulate = Color($"../Sprite2D".modulate, curve.sample(time))
	
	if (time >= 1.1):
		$"../Voice".play()
		$"../papier".play()
		$"../nomInterdit2".show()
		queue_free()
		on_open_parchemin.emit()
		$"../ParcheminLore".setok()
		$"../AnimationPlayer".play("parchemin2")
		
