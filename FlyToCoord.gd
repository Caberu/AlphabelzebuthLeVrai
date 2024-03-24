extends Node2D

var start
var midpoint
@export var coord : Vector2
@export var curve : Curve
@export var curve2 : Curve

var time := 0.0

func _ready():
	midpoint = Vector2.from_angle(randf()*1000)*50

func _process(delta):
	time += delta*2
	

	$"..".global_position = lerp(start, coord, curve.sample(time)) + lerp(Vector2.ZERO, midpoint, curve2.sample(time))
	if (global_position.x < 0 or global_position.y > 360):
		get_tree().get_first_node_in_group("Alphabet").on_update_stock()
		$"..".queue_free()

