extends Node2D

var idx := 1.0

var ok := false

var time := 0.0
var cd := 0.5

func setok():
	ok = true

func skip_lore():
	if (idx==1):
		$"../AnimationPlayer".play("parcheminClose")
		idx = 2

func _process(delta):
	if (!ok):
		return
	cd-=delta
	if (cd <0 and Input.is_action_just_pressed("Skip")):
		if (idx==1):
			$"../AnimationPlayer".play("parcheminClose")
			idx = 2
			$"../Voice".stop()
		elif (idx==2):
			$"../AnimationPlayer".play("parcheminNext")
			idx = 3
		elif (idx==3):
			$"../AnimationPlayer".play("parcheminEnd")
			idx = 4
	
	if (idx == 4):
		time += delta
		$"../..".modulate = lerp(Color.WHITE, Color.BLACK, clamp(time/3,0,1))
		if (time > 3):
			get_tree().change_scene_to_file("res://Scenes/main.tscn")
