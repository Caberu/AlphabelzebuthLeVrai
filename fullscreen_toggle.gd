extends Node

var fullscreenToggled := false

func _process(delta):
	if (Input.is_action_just_pressed("fullscreen_toggle")):
		fullscreenToggled = !fullscreenToggled
		if (fullscreenToggled):
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
