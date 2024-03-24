class_name MainCamera extends Node2D

var shake_force = 5
var reset_shake_time := 0.0
var center : Vector2 = Vector2(0,0)

var time := 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time+= delta
	if (time > reset_shake_time):
		shake_force = 0
	global_position = center+Vector2.from_angle(randf()*1000)*shake_force


func shake(time : float = 0.5,force : float = 1.0):
	shake_force = force
	reset_shake_time = self.time+time
