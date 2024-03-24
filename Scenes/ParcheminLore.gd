extends Node2D

var idx := 1

var ok := false

func setok():
	ok = true

func _process(delta):
	if (!ok):
		return
		
	if (Input.is_action_just_pressed("Skip")):
		if (idx==1):
			$"../AnimationPlayer".play("parcheminClose")
			idx = 2
		elif (idx==2):
			$"../AnimationPlayer".play("parcheminNext")
			idx = 3
		elif (idx==3):
			$"../AnimationPlayer".play("parcheminEnd")
