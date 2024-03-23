extends Node2D

@export var demon_scene : PackedScene

var open := false

@export var portal_on : Texture2D
@export var portal_off : Texture2D

@onready var word : Word = get_tree().get_first_node_in_group("Word")


func _ready():
	word.on_update_correctness.connect(on_update_correctness)

func on_update_correctness():
	open = word.correct
	update_open()

func update_open():
	$Sprite2D.texture = portal_on if (open)  else portal_off

func _on_click():
	instantiate_demon(demon_scene)


func instantiate_demon(scene : PackedScene):
	var instance : Node2D = scene.instantiate()
	$"../Demons".add_child(instance)
	instance.global_position = global_position
	
	
