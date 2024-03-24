class_name Walk extends Node2D

@export var speed : float = 5

@onready var parent : Node2D = $".."
@onready var anim_player : AnimationPlayer = $"../AnimationPlayer"

var anim_string : String
var moving : bool = true

func _process(delta):
	if anim_player == null: print("anim is null")
	if moving:
		move(delta)
		anim_player.play("mobs/" + anim_string + "_run")
	else:
		anim_player.play("mobs/" + anim_string + "_fight")
	
func move(modifier : float = 1.0):
	parent.position.x += speed * modifier
	
func toggle_move(val: bool):
	moving = val
	
